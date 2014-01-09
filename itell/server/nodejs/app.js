//include config
var config = require('./config');
var flow = require('flow');
var string = require('string');

//mysql database driver
var connectDB = require('./connectdb');
var mydb = new connectDB(config.db_host, config.db_port, config.db_user, config.db_passwd, config.db_name);
mydb.connect(function(err) {
    //console.log(err);
    if (err) {
        logger.log('error', 'Connection error ->'+err);
    } else {
        logger.log('info', 'Connection to DB success');
    }
    
})

var socket = require('socket.io');
var port = parseInt(process.argv[2]);
if (port > 0) {

} else {
    port = config.sk_port_default;
}

server = socket.listen(port);
server_name = config.sk_host + ':' + port;

//winston log
var winston = require('winston');
var logger = new (winston.Logger) ({
    transports: [
        new winston.transports.File({filename  : './logs/socket.log'})
    ],
    exceptionHandlers: [
        new winston.transports.Console(),
        new winston.transports.File({filename : './logs/error.log'})
    ]
});

//redis store 


var  redis = require('redis');
var connectRedis = require('./connectRedis');

var pub = new connectRedis(config.redis_host, config.redis_port, config.redis_passwd);
var sub = new connectRedis(config.redis_host, config.redis_port, config.redis_passwd);
var store = new connectRedis(config.redis_host, config.redis_port, config.redis_passwd);


// configuration for socket server
server.configure( function(){
	server.enable('browser client minification');  // send minified client
	server.enable('browser client etag');          // apply etag caching logic based on version number
	server.enable('browser client gzip');          // gzip the file
	server.set('log level', 1);                    // reduce logging
	server.set('transports', [                     // enable all transports (optional if you want flashsocket)
	    'websocket'	  
	  , 'htmlfile'
	  , 'xhr-polling'
	  , 'jsonp-polling'
	]);
	var RedisStore = require('socket.io/lib/stores/redis');        
	server.set('store', new RedisStore({redisPub:pub.getRedisClient(), redisSub:sub.getRedisClient(), redisClient:store.getRedisClient()}));
});


// handler connection
server.sockets.on('connection', function(socket) {
        logger.log('info', 'client connect to server with socket_id ->' + socket.id);
        
        sub.getRedisClient().subscribe('public', 'chat', 'notification');
        
        sub.getRedisClient().on('message', function(channel, message) {
            //console.log(channel, message);
            if (channel == 'public') {
                //console.log(channel, message);
                var data = JSON.parse(message);
                //console.log(data);
                
                if (data.action === 'join server'
                    && socket.user_id != data.user_id) {
                    message = {'user': data.nick};
                    socket.emit('login', message);
                }
                
                if (data.action === 'logout') {
                    message = {'user': data.user};
                    socket.emit('logout', message);
                }
            }
            
            if (channel === 'chat') {
                var data = JSON.parse(message);
                //console.log('chat', data);
                if (data.receiver === socket.user_id) {
                    socket.emit('message', message);
                }
            }
            
            if (channel === 'notification') {
                var data = JSON.parse(message);
                //console.log('chat', data);
                if (data.receiver === socket.user_id) {
                    socket.emit('message', message);
                    //change invite status in db
                    mydb.changeInviteStatusOne({ 'user_id': data.user_id, 'friend_id': data.friend_id }, function(err){
                        //console.log(err);
                        if (err) {
                            logger.log('err', 'error update status invite for user->' + data.user_id + ' friend->' + data.friend_id);
                        }
                        logger.log('info', 'success update status invite for user->' + data.user_id + ' friend->' + data.friend_id);
                    });
                }
            }
        })
        
        socket.on('disconnect', function(){
            //sub.unsubscribe('itell');
            //sub.quit();
           store.removeConnection(socket.user_id, server_name);
           logger.log('info', 'disconnected user:'+ socket.user_id);
           pub.getRedisClient().publish('public', JSON.stringify({'action' : 'logout' , 'user' : socket.user_id}));
        })
       
        /**
         *  handler join server
         *  @param msg Object
         *  @param callback function
         */
        
        socket.on('join_server', function(data, callback) {
            try {
                var msg = JSON.parse(data);

                logger.log('info', 'client request join server user_id:' + msg.user_id + ' uuid:' + msg.uuid);
                //console.log(msg);
                if (! msg.user_id
                    || ! msg.uuid) {
                        result = {
                            'retval' : false,
                            'error_code' : 0,
                            'error_msg' : 'not found user'
                        };
                        callback(JSON.stringify(result));
                        return 0;
                    } 

                var user_id = msg.user_id;
                var uuid = msg.uuid;
                var result, resp;

                //find user in db and return response
                flow.exec(
                    function(){
                        //console.log('get user', user_id, uuid);
                        mydb.getUser({'user_id': user_id, 'uuid': uuid}, this);
                    },
                    function(err, results) {
                        if (err) {
                            logger.log('error', 'join server error not found user:' + user_id + ' uuid:' + uuid);
                            resp = {
                                'retval' : false,
                                'error_code' : 0,
                                'error_msg' : 'not found user'
                            };
                            callback(JSON.stringify(resp));
                            return 0;
                        }

                        var user_info = results;
                        if (user_info.length == 0) {
                            logger.log('error', 'join server error not found user:' + user_id + ' uuid:' + uuid);
                            resp = {
                                'retval' : false,
                                'error_code' : 0,
                                'error_msg' : 'not found user'
                            };
                            callback(JSON.stringify(resp));
                            return 0;
                        }

                        //insert connection to list
                        store.insertConnection(user_id, socket.id, server_name);
                        socket.user_id = user_id;

                        logger.log('info', 'join server success user:' + user_id + ' uuid:' + uuid);

                        // create a new room for user by id
                        //socket.join(user_id);
                        //socket.room = user_id;

                        //publish join server
                        pub.getRedisClient().publish('public', JSON.stringify({'action' : 'join server', 'user_id' : user_id, 'uuid' : uuid, 'nick' : user_info.nick}));

                        resp = {
                            'retval' : true,
                            'user_info' : user_info
                        };

                        //push message off-line
                        flow.exec(
                            function(){
                                store.getMessageOffline(user_id, this);
                            },
                            function(err, msgs) {
                                if (err) { 
                                    throw err;
                                    return 0;
                                }
                                if (msgs) {
                                    //console.log('offline', msgs);
                                    if (msgs.length >0) {
                                        for (var i in msgs) {
                                            var message = msgs[i];
                                            socket.emit('message', message);
                                        }
                                    }
                                }
                                //console.log('del message');
                                store.delMessageOffline(user_id);
                            }
                        )
                            
                        //push invite for user
                        flow.exec(
                            function(){
                                mydb.getInvite(user_id, this);
                            },
                            function(err, results) {
                                
                                if (err) {
                                    logger.log('err', 'error get invite for user:' + user_id );
                                    resp = {
                                        'retval' : false,
                                        'error_code' : 0,
                                        'error_msg' : 'error get invite'
                                    };
                                    callback(JSON.stringify(resp));
                                    return 0;
                                }
                                //no invite found
                                var invites = results;
                                if (!invites) {
                                    logger.log('info', 'no invite for user:' + user_id);
                                    resp = {
                                        'retval' : true,
                                        'msg' : 'no invite for user'
                                    };
                                    callback(JSON.stringify(resp));
                                    return 0;
                                }
                                //exists invite, push to client
                                logger.log('info', 'push invites to user:' + user_id + ' uuid:' + uuid);
                                
                                if (invites) {
                                    //console.log('invites', invites);
                                    
                                    if (invites.length >0) {
                                            var message = {};
                                            message.type = 'invite';
                                            message.receiver = user_id;
                                            message.count = invites.length;
                                            
                                            socket.emit('message', JSON.stringify(message));
                                    }
                                    
                                }
                                //change invite status in db
                                mydb.changeInviteStatus(user_id, function(err){
                                    //console.log(err);
                                    if (err) {
                                        logger.log('err', 'error update status invite for user:' + user_id );
                                    }
                                    logger.log('info', 'success update status invite for user:' + user_id );
                                });
                                
                                
                            }
                        )
                            
                            
                        callback(JSON.stringify(resp));
                        return 0;
                    }
                );
            } catch (err) {
                logger.log('error', 'join server error fatal' + err);
                var resp = {
                        'retval' : false,
                        'error_code' : 0,
                        'error_msg' : 'error join server'
                    };
                callback(JSON.stringify(resp));
                return 0;
                
            }
        });
        
        /**
         * handler message
         * @param msg Object
         * @param callback function
         */
        
        socket.on('message', function(message, callback) {
          try {
            var data = JSON.parse(message);
            //console.log('message', data);
            logger.log('info', ' post message from ' + data.sender + ' to ' + data.receiver);
            
            if (! data.sender
                || ! data.receiver
                || ! data.msg) {
                    var result = {
                        'retval' : false,
                        'error_code' : 0,
                        'error_msg' : 'not found user'
                    };
                    callback(JSON.stringify(result));
                    return 0;
                }
            var sender_id = parseInt(string(data.sender).trim().s);
            var receiver_id = parseInt(string(data.receiver).trim().s);
            var message = data.msg;
            var date = new Date();
            var times = date.getTime();
            
            flow.exec(
                function(){
                    mydb.checkUserById(sender_id, this.MULTI('sender'));
                    mydb.checkUserById(receiver_id, this.MULTI('receiver'));
                },
                function(results) {
                    //console.log('result', results);
                    if (! results.sender
                        || ! results.receiver) {
                        logger.log('error', 'not found sender or receiver:' + sender_id + ',' + receiver_id);
                        var result = {
                            'retval' : false,
                            'error_code' : 0,
                            'error_msg' : 'not found sender or receiver'
                        };
                        callback(JSON.stringify(result));
                        return 0;
                    }
                    
                    //check if receiver online or not
                    store.checkUserOnline(receiver_id, this);
                },
                function(online){
                    //console.log('result', online);
                    
                    if (! online) {
                        store.insertMessage(sender_id, receiver_id, message, times);
                        logger.log('info', 'enqueue message from:' + sender_id + ' to ' + receiver_id);
                        
                    } else {
                    
                        logger.log('info', 'send message success from:' + sender_id + ' to ' + receiver_id);
                        //socket.broadcast.to(receiver_id).emit('message', { 'sender' : sender_id, 'receiver' : receiver_id, 'msg' : message});
                        pub.getRedisClient().publish('chat', JSON.stringify({'sender' : sender_id, 'receiver' : receiver_id, 'msg' : message, 'timestamp' : times}));
                    }
                    var result = {
                        'retval' : true,
                        'sender' : sender_id,
                        'msg'   : message,
                        'timestamp' : times
                    };
                    callback(JSON.stringify(result));
                    return 0;
                    
                } 
              );
            } catch (err) {
                logger.log('error', 'message error fatal' + err);
                var resp = {
                        'retval' : false,
                        'error_code' : 0,
                        'error_msg' : 'error message'
                    };
                callback(JSON.stringify(resp));
                return 0;
                
            }     
            
        });
       
});



