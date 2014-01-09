require 'openssl'

class CoolioServiceController < ApplicationController
  def Hello

    render :nothing => true
    
    uid = 0
    @users = User.where(:email => params[:myId])
    @users.each do |user|
      uid = user.id
    end

    devices = []
    deviceId = ''
    @devices = Device.where(:my_id => uid)
    @devices.each do |device|
      deviceId = device.deviceId
      deviceId = deviceId.gsub(/[<> ]/, '')
      devices << deviceId
    end

    if deviceId then
      notice = MyNotice.new
      notice.send(devices, "Hello iPhone!")
    end
  end

  def doLogin

    retString = "success"

    _id = params[:email]
    #_pass = HMAC::MD5.new(params[:password]).hexdigest
    _pass = OpenSSL::HMAC::hexdigest(OpenSSL::Digest::SHA1.new, "password-key", params[:password])
    p _pass

    #bLogin = Login.where(:name => _id).where(:password => _pass).exists?
    bLogin = User.where(:email => _id).where(:password => _pass).exists?
 
    p bLogin

    if bLogin then
      @users = User.where(:email => _id).where(:password => _pass)
      @users.each do |user|
        if user.freezeAccount == true then
            retString = "lock"
        end
      end

      @blackLists = Blacklist.where(:email => _id)
      @blackLists.each do |blackList|
        retString = "lock"
      end
    else
      retString = "failure"
    end

    respond_to do |format|
      format.json { render :json => retString }
    end

  end

  def doLogout
    render :nothing => true

    _id = params[:email]

    @users = User.where(:email => _id)
    @users.each do |user|
        user.online = false
        user.save
    end
  end

  def doNewAccountCheck
    id = params[:email]
    nickName =  params[:nickName]

    if User.where("email = ? OR nickname = ?", id, nickName).exists? then
      respond_to do |format|
        format.json { render :json => "failure" }
      end
    else
      respond_to do |format|
        format.json { render :json => "success" }
      end
    end

  end

  def getMyInfo
    @users = User.where(:email => params[:email])
    respond_to do |format|
      format.json { render :json => @users.to_json() }
    end
  end

  def getMasterPassword
    userId = 0
    @users = User.where(:email => params[:email])
    @users.each do |user|
      userId = user.id
    end

    masterPass = ""
    @passs = Masterpassword.where(:user_id => userId)
    @passs.each do |pass|
      masterPass = pass.masterpassword
    end

    respond_to do |format|
      format.json { render :json => masterPass }
    end
  end

  def getUserOne
    #id = params[:email]
 
    statusHash = Hash.new
    statusHash['friend'] = "failure"
    statusHash['silentMatch'] = "failure"
    statusHash['block'] = "failure"
    statusHash['isBlock'] = "failure"
    statusHash['isChat'] = "failure"

    userId = 0
    myId = 0

    @myInfo = User.where(:email => params[:myId])
    @myInfo.each do |my|
      myId = my.id
    end

    @userInfo = User.where(:email => params[:userId])
    @userInfo.each do |user|
      userId = user.id
    end 

    if myId != userId then
      if SilentMatch.where(:my_id => myId).where(:user_id => userId).exists? then
        statusHash['silentMatch'] = "success"
      end

      if Friend.where(:my_id => myId).where(:user_id => userId).exists? then
        statusHash['friend'] = "success"
      end

      if Block.where(:my_id => myId).where(:user_id => userId).exists? then
        statusHash['block'] = "success"
      end

      if Block.where(:my_id => userId).where(:user_id => myId).exists? then
        statusHash['isBlock'] = "success"
      end

      if Chat.where(:my_id => myId).where(:user_id => userId).exists? then
        statusHash['isChat'] = "success"
      end
    
      if Chat.where(:my_id => userId).where(:user_id => myId).exists? then
        statusHash['isChat'] = "success"
      end
    end

    @users = User.where(:email => params[:userId])

    retHash = Hash.new
    retHash['profile'] = @users
    retHash['status'] = statusHash

    respond_to do |format|
      #format.json { render :json => @users.to_json() }
      format.json { render :json => retHash }
    end    
  end

  # def getState


  #   respond_to do |format|
  #       format.json { render :json => retHash }
  #   end
  # end

  def getMyUnreadCount

    retHash = Hash.new
    retHash['friendRequestCount'] = 0
    retHash['matchCount'] = 0
    retHash['footPrintCount'] = 0
    retHash['alertCount'] = 0
    retHash['infomationCount'] = 0
    retHash['chatSumCount'] = 0

    myId = 0
    @myInfo = User.where(:email => params[:myId])
    @myInfo.each do |my|
        myId = my.id
    end

    if NotificationCount.where(:my_id => myId).exists? then
      @cn = NotificationCount.where(:my_id => myId)
      @cn.each do |c|
        retHash['friendRequestCount'] = c.friendRequestCount
        retHash['matchCount'] = c.matchCount
        retHash['footPrintCount'] = c.footPrintCount
        retHash['alertCount'] = c.alertCount
        retHash['infomationCount'] = c.infomationCount
      end
    end

    sqlQuery = <<-SQL
      SELECT sum(countValue) as sum_id
       FROM chat_notification_counts
       WHERE my_id = ?
    SQL

    if ChatNotificationCount.where(:my_id => myId).exists? then
        @cn = ChatNotificationCount.find_by_sql([sqlQuery, myId])
        @cn.each do |c|
          if c.sum_id == nil then
            retHash['chatSumCount'] = 0
          else
            retHash['chatSumCount'] = c.sum_id.to_i
          end
        end
    end

    respond_to do |format|
        format.json { render :json => retHash }
    end
  end

  def getChatUnreadCount

    retHash = Hash.new
    retHash['chatCount'] = 0

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

    if ChatNotificationCount.where(:my_id => myId).where(:user_id => userId).exists? then
        @chatCounts = ChatNotificationCount.where(:my_id => myId).where(:user_id => userId)
        @chatCounts.each do |chat|
          retHash['chatCount'] = chat.countValue
        end
    end

    respond_to do |format|
        format.json { render :json => retHash }
    end
  end

  def doUnSubscribe
    #render :nothing => true
    
    retString = "failure"

    _id = params[:email]
    #_pass = HMAC::MD5.new(params[:password]).hexdigest
    _pass = OpenSSL::HMAC::hexdigest(OpenSSL::Digest::SHA1.new, "password-key", params[:password])

    @users = User.where(:email => params[:email]).where(:password => _pass)
    @users.each do |user|
        user.freezeAccount = true
        user.save
        retString = "success"
    end

    respond_to do |format|
        format.json { render :json => retString }
    end
  end

  def doBlackListCheck
    retString = "success"

    _id = params[:email]

    @blackLists = Blacklist.where(:email => _id)
    @blackLists.each do |blackList|
        retString = "failure"
    end
    respond_to do |format|
        format.json { render :json => retString }
    end
  end

  def doNoticeCountReset
    render :nothing => true

    cmd = params[:command]

    uid = 0
    @users = User.where(:email => params[:myId])
    @users.each do |user|
        uid = user.id
    end

    # Set Notification count value of ZERO
    if NotificationCount.where(:my_id => uid).exists? then
      @counts = NotificationCount.where(:my_id => uid)
      @counts.each do |c|
        if cmd == "friendRequest" then
          c.friendRequestCount = 0
        end

        if cmd == "match" then
          c.matchCount = 0
        end

        if cmd == "footprint" then
          c.footPrintCount = 0
        end

        c.save
      end
    end
  end

  def doChatCountReset
    render :nothing => true

    #cmd = params[:command]

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

    # Reset chat count
    if ChatNotificationCount.where(:my_id => myId).where(:user_id => userId).exists? then
        @chatCounts = ChatNotificationCount.where(:my_id => myId).where(:user_id => userId)
        @chatCounts.each do |chatCount|
            chatCount.countValue = 0
            chatCount.save
        end
    end
  end

end

