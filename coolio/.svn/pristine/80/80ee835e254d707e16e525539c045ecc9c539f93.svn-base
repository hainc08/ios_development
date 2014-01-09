class FriendServiceController < ApplicationController

  def doFriend

    id = 0
    @myInfo = User.where(:email => params[:myId])
    @myInfo.each do |my|
        id = my.id
    end
    
    friendId = 0
    @friendInfo = User.where(:email => params[:friendId])
    @friendInfo.each do |friend|
        friendId = friend.id
    end 

    retString = "success"

    if Friend.where(:my_id => id).where(:user_id => friendId).exists? then
        retString = "success"
    else
        retString = "failure"
    end

    respond_to do |format|
        format.json { render :json => retString }
    end      
  end

  def getFriend
    id = params[:myId]

    uid = 0
    @users = User.where(:email => id)
    @users.each do |user|
        uid = user.id
    end

    #@friends = Friend.find(:all, :conditions => ["my_id = ?", uid], :order => "id ASC")
    sqlQuery = <<-SQL
      SELECT DISTINCT email,nickname,age,height,weight,
           lookingLover,lookingFriend, lookingEPal, lookingMPal,lookingTPal,lookingCircle,lookingRoommate,lookingBPartner,lookingFriendWithBenefits,
           picture1, friends.updated_at AS updated_at 
      FROM users INNER JOIN friends ON friends.user_id = users.id
      WHERE friends.my_id = ?
      AND
      (freezeAccount != NULL OR freezeAccount = false)
      AND
      users.id NOT IN (SELECT blocks.user_id FROM blocks, users WHERE users.id = blocks.user_id AND blocks.my_id =  ?)
      AND
      users.id NOT IN (SELECT blocks.my_id FROM blocks, users WHERE users.id = blocks.user_id AND blocks.user_id =  ?)
      AND
      users.email NOT IN (SELECT blacklists.email FROM blacklists)
      ORDER BY friends.updated_at DESC
    SQL
    @friends = Friend.find_by_sql([sqlQuery, uid, uid, uid])

    respond_to do |format|
      #format.json { render :json => @friends.to_json(:include => :user) }
      format.json { render :json => @friends.to_json() }
    end
  end


  def getFriendRequest
    id = params[:myId]

    uid = 0
    @users = User.where(:email => id)
    @users.each do |user|
        uid = user.id
    end

    sqlQuery = <<-SQL
        SELECT DISTINCT
                email,nickname,age,height,weight, '' AS updated_at,
                lookingLover,lookingFriend,lookingEPal,lookingMPal,lookingTPal,lookingCircle,lookingRoommate,lookingBPartner,lookingFriendWithBenefits,
                picture1
         FROM users LEFT JOIN friend_requests ON friend_requests.user_id = users.id
         WHERE users.id IN 
         (SELECT friend_requests.my_id FROM friend_requests WHERE friend_requests.user_id = ?) 
         AND users.email != ?
         AND (users.freezeAccount != NULL OR users.freezeAccount = false)
         AND users.id NOT IN (SELECT blocks.user_id FROM blocks, users WHERE users.id = blocks.user_id AND blocks.my_id =  ?)
         AND users.id NOT IN (SELECT blocks.my_id FROM blocks, users WHERE users.id = blocks.user_id AND blocks.user_id =  ?)
         AND users.email NOT IN (SELECT blacklists.email FROM blacklists)
         ORDER BY friend_requests.updated_at DESC
    SQL

    #, friend_requests.updated_at AS updated_at
    #ORDER BY friend_requests.updated_at DESC

    @friendsReq = User.find_by_sql([sqlQuery, uid, id, uid, uid])

    sqlQuery = <<-SQL
        SELECT updated_at FROM friend_requests
          WHERE friend_requests.my_id = (SELECT id FROM users WHERE email = ?)
          AND  friend_requests.user_id = (SELECT id FROM users WHERE email = ?)
    SQL

    email = nil
    @friendsReq.each do |req|
      email = req.email
      if email != id then
        @fq = FriendRequest.find_by_sql([sqlQuery, email, id])
        @fq.each do |f|
          req.updated_at = f.updated_at
        end
      end
    end

    respond_to do |format|
        format.json { render :json => @friendsReq.to_json() }
    end
  end


  def setFriendRequest
    render :nothing => true

    myId = 0
    myNickName = nil
    @myInfo = User.where(:email => params[:myId])
    @myInfo.each do |my|
        myId = my.id
        myNickName = my.nickname
    end

    userId = 0
    @userInfo = User.where(:email => params[:userId])
    @userInfo.each do |user|
        userId = user.id
    end

    #if FriendRequest.where(:my_id => myId).where(:user_id => userId).exists? then
	#return
    #end
 
    friend = Friend.new
    friend.my_id = myId
    friend.user_id = userId
    friend.save

    friendRequest = FriendRequest.new
    friendRequest.my_id = myId
    friendRequest.user_id = userId
    friendRequest.save

    # Set FriendRequest count value
    if NotificationCount.where(:my_id => userId).exists? then
      @counts = NotificationCount.where(:my_id => userId)
      @counts.each do |c|
        if c.friendRequestCount then
          c.friendRequestCount = 1
          c.save
        else
          c.friendRequestCount = c.friendRequestCount + 1
          c.save
        end
      end
    else
      c = NotificationCount.new
      c.my_id = userId
      c.friendRequestCount = 1
      c.save
    end

    # Do Friend notification call.
    #devices = []
    #deviceId = ''
    #@devices = Device.where(:my_id => userId)
    #@devices.each do |device|
    #  deviceId = device.deviceId
    #  deviceId = deviceId.gsub(/[<> ]/, '')
    #  devices << deviceId
    #end

    #if deviceId then
    #  notice = MyNotice.new
    #  notice.send(devices, "You've been added to " + myNickName + "'s friend lists.", "friend")
    #end
    message = "You've been added to " + myNickName + "'s friend lists."
    type = "friend"

    ios_notice(message, type)
    android_notice(message)
  end


  def removeFriendRequest
    render :nothing => true

    myId = 0
    #myNickName = nil
    @myInfo = User.where(:email => params[:myId])
    @myInfo.each do |my|
      myId = my.id
      #myNickName = my.nickname
    end

    userId = 0
    @userInfo = User.where(:email => params[:userId])
    @userInfo.each do |user|
      userId = user.id
    end

    # 既にフレンドだったら解除
    friendId = 0
    if Friend.where(:my_id => myId).where(:user_id => userId).exists? then
      @friends = Friend.where(:my_id => myId).where(:user_id => userId)
      @friends.each do |friend|
        friendId = friend.id
        Friend.destroy(friendId)
      end
    end

    friendRequestId = 0
    if FriendRequest.where(:my_id => myId).where(:user_id => userId).exists? then
      @friendRequests = FriendRequest.where(:my_id => myId).where(:user_id => userId)
      @friendRequests.each do |friendRequest|
        friendRequestId = friendRequest.id
        FriendRequest.destroy(friendRequestId)
      end
    end

  end

  def ios_notice(message, type)
      # Do Match notification call
      devices = []
      deviceId = nil
      @devices = Device.where(:my_id => userId).where(:os => 0)
      @devices.each do |device|
        deviceId = device.deviceId
        deviceId = deviceId.gsub(/[<> ]/, '')
        devices << deviceId
      end

      if devices != nil then
        notice = IosNotice.new
        notice.send(devices, message, type)
      end
  end

  def android_notice(message)
      # Do Match notification call
      devices = []
      deviceId = nil
      @devices = Device.where(:my_id => userId).where(:os => 1)
      @devices.each do |device|
        deviceId = device.deviceId
        #deviceId = deviceId.gsub(/[<> ]/, '')
        devices << deviceId
      end

      if devices != nil then
        notice = AndroidNotice.new
        notice.send(devices, message)
      end
  end


end

