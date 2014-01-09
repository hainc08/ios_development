class SilentMatchServiceController < ApplicationController

  def getSilentMatch
    id = params[:myId]

    uid = 0
    @users = User.where(:email => id)
    @users.each do |user|
        uid = user.id
    end

    #@silentMatches = SilentMatch.find(:all, :conditions => ["my_id = ?", uid], :order => "id ASC")
    sqlQuery =<<-SQL
      SELECT DISTINCT email,nickname,age,height,weight,
           lookingLover,lookingFriend, lookingEPal, lookingMPal,lookingTPal,lookingCircle,lookingRoommate,lookingBPartner,lookingFriendWithBenefits,
           picture1, silent_matches.updated_at AS updated_at 
      FROM users INNER JOIN silent_matches ON silent_matches.user_id = users.id 
      WHERE silent_matches.my_id = ?
         AND (users.freezeAccount != NULL OR users.freezeAccount = false)
         AND users.id NOT IN (SELECT blocks.user_id FROM blocks, users WHERE users.id = blocks.user_id AND blocks.my_id =  ?)
         AND users.id NOT IN (SELECT blocks.my_id FROM blocks, users WHERE users.id = blocks.user_id AND blocks.user_id =  ?)
         AND users.email NOT IN (SELECT blacklists.email FROM blacklists)
      ORDER BY silent_matches.updated_at DESC
    SQL

    @silentMatches = SilentMatch.find_by_sql([sqlQuery, uid, uid, uid])
    respond_to do |format|
      format.json { render :json => @silentMatches.to_json() }
    end
  end

  def getMatch
    id = params[:myId]

    uid = 0
    @users = User.where(:email => id)
    @users.each do |user|
        uid = user.id
    end

    #@matches = Match.find(:all, :conditions => ["my_id = ?", uid], :order => "id ASC").uniq
    sqlQuery =<<-SQL
      SELECT DISTINCT email,nickname,age,height,weight,
           lookingLover,lookingFriend, lookingEPal, lookingMPal,lookingTPal,lookingCircle,lookingRoommate,lookingBPartner,lookingFriendWithBenefits,
           picture1, matches.updated_at AS updated_at
      FROM users INNER JOIN matches ON matches.user_id = users.id 
      WHERE matches.my_id = ?
         AND (users.freezeAccount != NULL OR users.freezeAccount = false)
         AND users.id NOT IN (SELECT blocks.user_id FROM blocks, users WHERE users.id = blocks.user_id AND blocks.my_id =  ?)
         AND users.id NOT IN (SELECT blocks.my_id FROM blocks, users WHERE users.id = blocks.user_id AND blocks.user_id =  ?)
         AND users.email NOT IN (SELECT blacklists.email FROM blacklists)
       ORDER BY matches.updated_at DESC
    SQL

    @matches = Match.find_by_sql([sqlQuery, uid, uid, uid])
    respond_to do |format|
      format.json { render :json => @matches.to_json() }
    end
  end

  def doSilentMatch

    id = 0
    myNickName = nil
    @myInfo = User.where(:email => params[:myId])
    @myInfo.each do |my|
        id = my.id
        myNickName = my.nickname
    end
    
    silentMatchId = 0
    @silentMatchInfo = User.where(:email => params[:silentMatchId])
    @silentMatchInfo.each do |silentMatch|
        silentMatchId = silentMatch.id
    end 

    retString = "success"

    if SilentMatch.where(:my_id => id).where(:user_id => silentMatchId).exists? then
        retString = "success"
    else
        retString = "failure"
    end

    respond_to do |format|
      format.json { render :json => retString }
    end
  end

  def setSilentMatchRequest
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

    # サイレントマッチ登録
    silentMatch = SilentMatch.new
    silentMatch.my_id = myId
    silentMatch.user_id = userId
    silentMatch.save

      # 相手のサイレントマッチに自分が登録されていたら、マッチ
    if SilentMatch.where(:my_id => userId).where(:user_id => myId).exists? then
      match = Match.new
      match.my_id = myId
      match.user_id = userId
      match.save

      match = Match.new
      match.my_id = userId
      match.user_id = myId
      match.save

        # Set FriendRequest count value
      if NotificationCount.where(:my_id => myId).exists? then
        @counts = NotificationCount.where(:my_id => myId)
        @counts.each do |c|
          c.matchCount = c.matchCount + 1
          c.save
        end
      else
        c = NotificationCount.new
        c.my_id = myId
        c.matchCount = 1
        c.save
      end

      if NotificationCount.where(:my_id => userId).exists? then
        @counts = NotificationCount.where(:my_id => userId)
        @counts.each do |c|
          c.matchCount = c.matchCount + 1
          c.save
        end
      else
        c = NotificationCount.new
        c.my_id = userId
        c.matchCount = 1
        c.save
      end

      message = "You matched with " + myNickName + "."
      type = "match"
      ios_notice(message, type)
      android_notice(message)
    end
  end


  def removeSilentMatchRequest
    render :nothing => true

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

    # 既にサイレントマッチだったら解除
    silentMatchId = 0
    if SilentMatch.where(:my_id => myId).where(:user_id => userId).exists? then
      @silentMatches = SilentMatch.where(:my_id => myId).where(:user_id => userId)
      @silentMatches.each do |silentMatch|
        silentMatchId = silentMatch.id
        SilentMatch.destroy(silentMatchId)
      end

      # 自分のマッチ状態を解除
      matchId = 0
      @matches = Match.where(:my_id => myId).where(:user_id => userId)
      @matches.each do |match|
        matchId = match.id
        Match.destroy(matchId)
      end

      # 相手のマッチ状態を解除
      matchId = 0
      @matches = Match.where(:my_id => userId).where(:user_id => myId)
      @matches.each do |match|
        matchId = match.id
        Match.destroy(matchId)
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

