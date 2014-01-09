//mysql database
var mysql = require('mysql');

/**
 * constructor
 * @param host string
 * @param port int
 * @param user string
 * @param passwd string
 * @param dbname string
 */
connectDB = function(host, port, user, passwd, dbname) {
    this.db = mysql.createConnection({
        'host' : host,
        'port' : port,
        'user' : user,
        'password' : passwd,
        'database' : dbname
    });
    
}

/**
 * connect to db
 * @param callback function
 */
connectDB.prototype.connect = function(callback) {
    this.db.connect(function(err){
        callback(err);
        console.log('DB connected');
        
    });
}

/**
 * get user data
 * @param user Object
 * @param callback function
 */
connectDB.prototype.getUser = function(user, callback) {
    var user_id = user.user_id;
    var uuid = user.uuid;
    var query = ' select * from users where  id="' + user_id + '" and uuid="' + uuid + '"';
    this.db.query(query, function(err, rows, fields){
        if (err) {
            callback(err, null);
            return 0;
        }
        
        if (rows.length == 0) {
            callback(null, rows);
            return 1;
        }
        
        callback(null, rows[0]);
        return 1;
    });
}

/**
 * check user by Id
 * @param user_id int
 * @param callback function
 */
connectDB.prototype.checkUserById = function(user_id, callback) {
    var query = ' select * from users where  id="' + user_id + '"';
    this.db.query(query, function(err, rows, fields){
        if (err) {
            callback(err);
            return 0;
        }
        
        //console.log(rows);
        
        if (rows.length == 0) {
            callback(null);
            return 1;
        }
        
        callback(rows[0]);
        return 1;
    });
}

/**
 * get invite for user to push
 * @param int user_id
 * @param function callback
 */
connectDB.prototype.getInvite = function(user_id, callback) {
    var query = ' select * from user_friend_invites where  friend_id="' + user_id + '" and status=1 ';
    this.db.query(query, function(err, rows, fields){
        if (err) {
            callback(err, null);
            return 0;
        }
        
        //console.log(rows);
        
        if (rows.length == 0) {
            callback(null, null);
            return 1;
        }
        
        callback(null, rows);
        return 1;
    });
    
    
}

/**
 * change invite status for user
 * @param int user_id
 * @param function callback
 */
connectDB.prototype.changeInviteStatus = function(user_id, callback) {
    var query = ' update user_friend_invites set status =2 where  friend_id="' + user_id + '" and status=1 ';
    this.db.query(query, function(err, rows, fields){
        if (err) {
            callback(err);
            return 0;
        }
        
        //console.log(rows);
        callback(null);
        return 1;
    });
}

/**
 * change one invite status for user
 * @param Object data
 * @param function callback
 */
connectDB.prototype.changeInviteStatusOne = function(data, callback) {
    var user_id = data.user_id;
    var friend_id = data.friend_id;
    var query = ' update user_friend_invites set status =2 where  user_id="' + user_id + '" and friend_id="' + friend_id + '" and status=1 ';
    this.db.query(query, function(err, rows, fields){
        if (err) {
            callback(err);
            return 0;
        }
        
        //console.log(rows);
        callback(null);
        return 1;
    });
}

module.exports = connectDB;

