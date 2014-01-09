var redis = require('redis');

/**
 * constructor
 * @param host string
 * @param port int
 * @param passwd string
 */ 
connectRedis  = function(host, port, passwd) {
    //console.log(host, port, passwd);
    this.redcli = redis.createClient(port, host);
    if (passwd != '') {
        this.redcli.auth(passwd, function(err){
            if (err) {
                throw err;
                return null;
            }
        })
    }
}

/**
 * get redis client
 */
connectRedis.prototype.getRedisClient = function() {
    return this.redcli;
}

/**
 * check user online
 * @param user_id int
 */
connectRedis.prototype.checkUserOnline = function(user_id, callback) {
    this.redcli.lrange("listConnection", 0, -1, function(err, replies){
        if (err) { 
            throw err;
            callback(null);
        }
        //console.log('reply' , replies.length);
        if (replies.length == 0) {
            callback(false);
        } else {
            replies.forEach(function(reply, i){
                var data = JSON.parse(reply);
                if (data.user_id == user_id) {
                    //console.log('found user in list');
                    callback(true);
                }
                if (i>=replies.length -1) {
                    callback(false);
                }
            }) 
        }
    })
}

/**
 * insert connection
 * @param user_id int
 * @param socket_id string
 * @param server_name string
 */
connectRedis.prototype.insertConnection = function(user_id, socket_id, server_name) {
    var that = this;
    this.redcli.lrange("listConnection", 0, -1, function(err, replies){
        if (err) {
            throw err;
            return null;
        }
        //console.log('reply' , replies.length);
        if (replies.length == 0) {
            that.redcli.rpush("listConnection", JSON.stringify({'user_id': user_id,'socket_id': socket_id}));

        } else {
            var index = -1;
            replies.forEach(function(reply, i){
                var data = JSON.parse(reply);
                if (data.user_id == user_id) {
                    index = i;
                    that.redcli.lset("listConnection", index, JSON.stringify({'user_id': user_id,'socket_id': socket_id}));
                    //logger.log('info', 'kickout device user_id:' + user_id);
                    //socket.broadcast.to(data.user_id).emit('kickout', {'user_id': user_id});
                }
                //console.log('i=',i);
                if (i >= replies.length -1
                    && index <0) {
                        that.redcli.rpush("listConnection", JSON.stringify({'user_id': user_id,'socket_id': socket_id}));
                    }
            }) 
        }
    });
    
    this.redcli.lrange('countConnection', 0, -1, function(err, replies){
        if (err) {
            throw err;
            return null;
        }
        
        if (replies.length == 0) {
            that.redcli.rpush("countConnection", JSON.stringify({'server': server_name, 'cc': 1}));

        } else {
            var index = -1;
            replies.forEach(function(reply, i){
                var data = JSON.parse(reply);
                if (data.server == server_name) {
                    index = i;
                    that.redcli.lset("countConnection", index, JSON.stringify({'server': server_name, 'cc': parseInt(data.cc) + 1}));
                }
                //not found in list 
                if (i >= replies.length -1
                    && index <0) {
                        that.redcli.rpush("countConnection", JSON.stringify({'server': server_name, 'cc': 1}));
                    }
            }) 
        }
    })
    
} 

/**
 * remove connection
 * @param user_id int
 * @param socket_id string
 * @param server_name string
 */
connectRedis.prototype.removeConnection = function(user_id, server_name) {
    var that = this;
    this.redcli.lrange('listConnection', 0, -1, function(err, replies){
        if (err) { 
            throw err;
            return null;
        }
        if (replies.length == 0) {
            
        } else {
            replies.forEach(function(reply, index){
                var data = JSON.parse(reply);
                if (data.user_id == user_id) {
                    that.redcli.lrem('listConnection', 0, reply, function(err){
                        if (err) throw err;
                    })
                }
            })
        }
    })
    
    this.redcli.lrange('countConnection', 0, -1, function(err, replies){
        if (err) { 
            throw err;
            return null;
        }
        if (replies.length == 0) {
            
        } else {
            replies.forEach(function(reply, index){
                var data = JSON.parse(reply);
                if (data.server == server_name) {
                    var cc = (parseInt(data.cc) > 0) ? parseInt(data.cc) - 1 : 0;
                    that.redcli.lset("countConnection", index, JSON.stringify({'server': server_name, 'cc':  cc}));
                }
            })
        }
    })
}

/**
 * insert message to queue when receiver not online
 * @param sender_id int
 * @param receiver_id int
 * @param message string
 */
connectRedis.prototype.insertMessage = function(sender_id, receiver_id, message, time) {
    
    this.redcli.rpush('listMessage', JSON.stringify({ 'sender' : sender_id, 'receiver' : receiver_id, 'msg' : message, 'timestamp' : time}));
    
}

/**
 * get message offline for user
 * @param user_id int
 */
//TODO: expire message after 30 mins
connectRedis.prototype.getMessageOffline = function(user_id, callback) {
    var msgs = [];
    this.redcli.lrange('listMessage', 0, -1, function(err, replies){
        if (err) { 
            throw err;
            callback(err, null);
        }
        if (replies.length == 0){
            callback(null, null);
        } else {
            replies.forEach(function(reply, index){
                var data = JSON.parse(reply);
                //console.log(data, user_id);
                if (data.receiver == user_id) {
                    msgs.push(reply);
                }
                if (index >= replies.length -1) {
                    //console.log(msgs);
                    callback(null, msgs);
                }
            })
        }
        
    })
    
}

/**
 * delete message offline for user
 * @param user_id int
 */
connectRedis.prototype.delMessageOffline = function(user_id) {
    var that = this;
    this.redcli.lrange('listMessage', 0, -1, function(err, replies){
        if (err) { 
            throw err;
            return 0;
        }
        if (replies.length == 0){
            return 0;
        } else {
            replies.forEach(function(reply, index){
                var data = JSON.parse(reply);
                //console.log(data, user_id);
                if (data.receiver == user_id) {
                    //console.log(reply);
                    that.redcli.lrem('listMessage', 0, reply, function(err){
                        if (err) throw err;
                    })
                }
                if (index >= replies.length -1) {
                    return 0;
                }
            })
        }
        
    })
    
}

module.exports = connectRedis;

