class ChatServiceController < ApplicationController

  def getChatList
  	id = params[:myId]

    sqlQuery = <<-SQL
        SELECT DISTINCT nickname, email, picture1, '' as countValue, '' AS updated_at
            FROM users
            WHERE users.id IN
            (SELECT chats.user_id FROM chats WHERE chats.user_id = (SELECT id FROM users WHERE email = ?)) AND email != ?
            AND
            (users.freezeAccount != NULL OR users.freezeAccount = false)
            AND
            users.id NOT IN (SELECT blocks.user_id FROM blocks, users
                                WHERE users.id = blocks.user_id AND blocks.my_id =  (SELECT id FROM users WHERE email = ?))
            AND
            users.id NOT IN (SELECT blocks.my_id FROM blocks, users
                                WHERE users.id = blocks.user_id AND blocks.user_id =  (SELECT id FROM users WHERE email = ?))
            AND
            users.email NOT IN (SELECT blacklists.email FROM blacklists)

        UNION

        SELECT DISTINCT nickname, email, picture1, '' as countValue, '' AS updated_at
            FROM users
            WHERE users.id IN
            (SELECT chats.user_id FROM chats WHERE chats.my_id = (SELECT id FROM users WHERE email = ?))
            AND
            (users.freezeAccount != NULL OR users.freezeAccount = false)            
            AND
            users.id NOT IN (SELECT blocks.user_id FROM blocks, users
                                WHERE users.id = blocks.user_id AND blocks.my_id =  (SELECT id FROM users WHERE email = ?))
            AND
            users.id NOT IN (SELECT blocks.my_id FROM blocks, users
                                WHERE users.id = blocks.user_id AND blocks.user_id =  (SELECT id FROM users WHERE email = ?))
            AND
            users.email NOT IN (SELECT blacklists.email FROM blacklists)

        UNION

        SELECT DISTINCT nickname, email, picture1, '' as countValue, '' AS updated_at
            FROM users
            WHERE users.id IN
            (SELECT chats.my_id FROM chats WHERE chats.user_id = (SELECT id FROM users WHERE email = ?))
            AND
            (users.freezeAccount != NULL OR users.freezeAccount = false)
            AND
            users.id NOT IN (SELECT blocks.user_id FROM blocks, users
                                WHERE users.id = blocks.user_id AND blocks.my_id =  (SELECT id FROM users WHERE email = ?))
            AND
            users.id NOT IN (SELECT blocks.my_id FROM blocks, users
                                WHERE users.id = blocks.user_id AND blocks.user_id =  (SELECT id FROM users WHERE email = ?))
            AND
            users.email NOT IN (SELECT blacklists.email FROM blacklists)
    SQL
    
    @chats = Chat.find_by_sql([sqlQuery, id, id, id, id, id, id, id, id, id, id])
    #@chats = Chat.find_by_sql([sqlQuery, id, id, id, id])

    sqlQuery = <<-SQL
        SELECT countValue FROM chat_notification_counts
          WHERE chat_notification_counts.my_id = (SELECT id FROM users WHERE email = ?)
          AND chat_notification_counts.user_id = (SELECT id FROM users WHERE email = ?)
    SQL

    email = nil
    @chats.each do |chat|
        email = chat.email
        if email != id then
            @cc = ChatNotificationCount.find_by_sql([sqlQuery, id, email])
            @cc.each do |c|
               chat.countValue = c.countValue
            end
        end
    end

    sqlQuery = <<-SQL
      SELECT MAX(updated_at) AS updated_at FROM chats
        WHERE chats.my_id = (SELECT id FROM users WHERE email = ?)
        AND chats.user_id = (SELECT id FROM users WHERE email = ?)
    SQL
    email = nil
    @chats.each do |chat|
      email = chat.email
      if email != id then
        @cc = Chat.find_by_sql([sqlQuery, id, email])
        @cc.each do |c|
          chat.updated_at = c.updated_at
        end
      end
    end

    respond_to do |format|
        format.json { render :json => @chats.to_json() }
    end
  end


  def getChatListDetail

    myId = 0
    @users = User.where(:email => params[:myId])
    @users.each do |user|
        myId = user.id
    end

    userId = 0
    @users = User.where(:email => params[:userId])
    @users.each do |user|
        userId = user.id
    end

    sqlQuery = <<-SQL
        SELECT my.picture1, my.nickname, my.email, chat.message, chat.pict, chat.updated_at
          FROM chats AS chat
          INNER JOIN users AS my ON my.id = chat.my_id 
          WHERE (chat.my_id = ? AND chat.user_id = ?) OR (chat.my_id = ? AND chat.user_id = ?) 
          AND DATE_ADD(chat.updated_at, INTERVAL 90 DAY) > NOW()
          ORDER BY chat.updated_at DESC
    SQL
    @chats = Chat.find_by_sql([sqlQuery, myId, userId, userId, myId])
    respond_to do |format|
        format.json { render :json => @chats.to_json() }
        #format.json { render :json => @chats }
    end
  end

  def getChatUnreadCount
  
    myId = 0
    @myInfo = User.where(:email => params[:myId])
    @myInfo.each do |my|
        myId = my.id
    end
  
    userId = 0
    @userInfo = User.where(:email => params[:userId])
    @userInfo.each do |user|
        userId = user.id
    end
   
    sqlQuery = <<-SQL
        SELECT countValue FROM chat_notification_counts WHERE my_id = ? AND user_id = ?
    SQL
  
    #  .where(:my_id => myId).where(:user_id => userId)
    @chatCounts = ChatNotificationCount.find_by_sql([sqlQuery, myId, userId])
    respond_to do |format|
        format.json { render :json => @chatCounts.to_json() }
    end
  end

  def setChatMessage
    render :nothing => true
    
    #id = params[:myId]
    #userId = params[:userId]
    message = params[:message]
    picture = params[:picture]

    message.gsub!(/^[\n]/ ,"")

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

    if myId > 0 && userId > 0 then
      chat = Chat.new
      chat.my_id = myId
      chat.user_id = userId
      chat.message = message

      if picture.blank? == false then
        File.open(Rails.root.to_s + '/public/picture/' + picture.original_filename, 'w') do |f|
          f.write(picture.read)
        end
        chat.pict = picture.original_filename
      end

      chat.touch
      chat.save

      #_countValue = 0
      if ChatNotificationCount.where(:my_id => userId).where(:user_id => myId).exists? then
        @chatCounts = ChatNotificationCount.where(:my_id => userId).where(:user_id => myId)
        @chatCounts.each do |chatCount|
          chatCount.countValue += 1 #_countValue + 1
          chatCount.save
        end
      else
        chatCount = ChatNotificationCount.new
        chatCount.my_id = userId
        chatCount.countValue = 1
        chatCount.user_id = myId
        chatCount.save
      end 
    
      # Do Friend notification call.
      #devicesArray = []
      #deviceId = ''
      #@devices = Device.where(:my_id => userId)
      #@devices.each do |device|
      #  deviceId = device.deviceId
      #  deviceId = deviceId.gsub(/[<> ]/, '')
      #  devicesArray << deviceId
      #end

      #if devicesArray then
      #  notice = MyNotice.new
      #  notice.sendChatMessage(devicesArray, myNickName + "\n" + message, "chat", params[:myId])
      #end
      message = myNickName + "\n" + message
      type = "chat"
      ios_notice(message, type, params[:myId])
      android_notice(message)
    end
  end

  def ios_notice(message, type, myId)
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
        notice.sendChatMessage(devices, message, type, myId)
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
        notice.sendChatMessage(devices, message)
      end
  end
end
