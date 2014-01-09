require 'erb'

class CoolioManagerController < ApplicationController
  def getUsers

    sqlQuery = <<-SQL
      SELECT id, picture1, nickName, email, freezeAccount, '' AS reportCount, '' AS alertCount
      FROM users AS user
      ORDER BY user.id DESC
    SQL

    reportSqlQuery = <<-SQL
      SELECT COUNT(DISTINCT reports.user_id) AS reportCount FROM reports
      WHERE reports.user_id = (SELECT id FROM users WHERE email = ?)
    SQL
    
    alertSqlQuery = <<-SQL
      SELECT COUNT(alerts.user_id) AS alertCount FROM alerts
        WHERE alerts.user_id = (SELECT id FROM users WHERE email = ?)
    SQL

    @users = User.find_by_sql([sqlQuery])
    @users.each do |user|
      @repots = Report.find_by_sql([reportSqlQuery, user.email])
      @repots.each do |report|
        user.reportCount = report.reportCount
      end

      @alerts = Alert.find_by_sql([alertSqlQuery, user.email])
      @alerts.each do |alert|
        user.alertCount = alert.alertCount
      end
    end

    #p @users

    respond_to do |format|
      format.json { render :json => @users.to_json() }
    end
  end


  def getUserDetail

    sqlQuery = <<-SQL
      SELECT
        email, nickName, age, height, weight, updated_at
      FROM users
      WHERE email = ?
    SQL

    @users = User.find_by_sql([sqlQuery, params[:myId]])
    p @users
    respond_to do |format|
      format.json { render :json => @users.to_json() }
    end
  end


  def getChatMessages
    myId = 0
    @users = User.where(:email => params[:userId])
    @users.each do |user|
        myId = user.id
    end


    sqlQuery = <<-SQL
        SELECT my.picture1, my.nickname, my.email, chat.message, chat.pict, chat.updated_at
          FROM chats AS chat
          INNER JOIN users AS my ON my.id = chat.my_id 
          WHERE chat.my_id = ? OR chat.user_id = ? 
          AND DATE_ADD(chat.updated_at, INTERVAL 90 DAY) > NOW()
          ORDER BY chat.updated_at DESC
    SQL
    @chats = Chat.find_by_sql([sqlQuery, myId, myId])
    respond_to do |format|
        format.json { render :json => @chats.to_json() }
        #format.json { render :json => @chats }
    end
  end

  def getChatAllMessages

    sqlQuery = <<-SQL
        SELECT my.id AS myId, my.picture1 AS myPict, my.nickname AS myNickName, my.email AS myEmail, my.freezeAccount AS myFreezeAccount,
               user.id AS userId, user.picture1 AS userPict, user.nickname AS userNickName, user.email AS userEmail, user.freezeAccount AS userFreezeAccount,
               chat.id AS chatId, chat.message, chat.pict, chat.updated_at
          FROM chats AS chat
          INNER JOIN users AS my ON my.id = chat.my_id
          INNER JOIN users AS user ON user.id = chat.user_id
          WHERE DATE_ADD(chat.updated_at, INTERVAL 90 DAY) > NOW()
          ORDER BY chat.updated_at DESC
    SQL
    @chats = Chat.find_by_sql([sqlQuery])
    respond_to do |format|
        format.json { render :json => @chats.to_json() }
    end
  end

  def doChatDelMessage
    render :nothing => true

    ids = params[:chats]
    idArray = ids.split(",")

    Chat.delete(idArray)

  end

  def getReportAll
    sqlQuery = <<-SQL
      SELECT my.picture1 AS myPict, my.nickname AS myNickName, my.email AS myEmail,
            user.id AS userId, user.picture1 AS userPict, user.nickname AS userNickName, user.email AS userEmail,
            COUNT(distinct report.user_id) AS reportCount, report.updated_at
        FROM reports AS report
        INNER JOIN users AS my ON my.id = report.my_id
        INNER JOIN users AS user ON user.id = report.user_id
        WHERE DATE_ADD(report.updated_at, INTERVAL 90 DAY) > NOW()
          AND my.freezeAccount = false AND user.freezeAccount = false
        ORDER BY report.updated_at DESC
    SQL
    @reports = Report.find_by_sql([sqlQuery])
    respond_to do |format|
        format.json { render :json => @reports.to_json() }
    end
  end

  def getReportDetail

    sqlQuery = <<-SQL
        SELECT DISTINCT users.nickName, users.email, reports.command
            FROM users, reports
            WHERE users.freezeAccount = false AND users.id IN
            (SELECT reports.my_id FROM reports WHERE reports.user_id = (SELECT id FROM users WHERE email = ?))
    SQL

    @reports = Report.find_by_sql([sqlQuery, params[:email]])
    respond_to do |format|
        format.json { render :json => @reports.to_json() }
    end
  end

  def getAlertAll
    sqlQuery = <<-SQL
      SELECT
        DISTINCT nickName, email, picture1, users.freezeAccount
      FROM users
      INNER JOIN alerts ON users.id = alerts.user_id
      WHERE users.freezeAccount = false
      ORDER BY alerts.updated_at DESC
    SQL

    @alerts = Alert.find_by_sql([sqlQuery])

    respond_to do |format|
        format.json { render :json => @alerts.to_json() }
    end
  end

  def getAlertDetail
    id = params[:email]

    sqlQuery = <<-SQL
      SELECT
        updated_at, message
      FROM alerts
      WHERE user_id = (SELECT id FROM users WHERE email = ?) ORDER BY alerts.updated_at DESC
    SQL

    @alerts = Alert.find_by_sql([sqlQuery, id])

    respond_to do |format|
        format.json { render :json => @alerts.to_json() }
    end

  end

  def doAlertSend
    render :nothing => true

    id = params[:email]
    message = params[:message]

    sqlQuery = <<-SQL
      SELECT id FROM users WHERE email = ?
    SQL

    uid = 0
    @users = User.find_by_sql([sqlQuery, id])
    @users.each do |user|
      uid = user.id

      alert = Alert.new
      alert.user_id = uid
      alert.message = message
      alert.save


      if NotificationCount.where(:my_id => uid).exists? then
        @cn = NotificationCount.where(:my_id => uid)
        #alertCount = 0
        @cn.each do |c|
          c.alertCount = c.alertCount + 1
          c.save
        end
      end


      # Do Alert notification call.
      #devices = []
      #deviceId = ''
      #@devices = Device.where(:my_id => uid)
      #@devices.each do |device|
      #  deviceId = device.deviceId
      #  deviceId = deviceId.gsub(/[<> ]/, '')
      #  devices << deviceId
      #end

      #if deviceId then
      #  notice = MyNotice.new
      #  notice.send(devices, message, "alert")
      #end
      ios_notice(message, "alert")
      android_notice(message)
    end

  end

  def getBlackListAll
    sqlQuery = <<-SQL
      SELECT email FROM blacklists ORDER BY updated_at DESC
    SQL

    @blackList = Blacklist.find_by_sql([sqlQuery])
    respond_to do |format|
        format.json { render :json => @blackList.to_json() }
    end
  end

  def doBlackListAdd
    render :nothing => true

    id = params[:email]


    if Blacklist.where("email = ?", id).exists? then
      return
    else
      blackList = Blacklist.new
      blackList.email = id
      blackList.save
    end
   
  end

  def doBlackListDelete
    render :nothing => true

    id  = params[:email]

    sqlQuery = <<-SQL
      SELECT id FROM blacklists WHERE email = ?
    SQL

    @blackList = Blacklist.find_by_sql([sqlQuery, id])
    @blackList.each do |list|
      list.delete
    end
  end

  def getInfoAll
    sqlQuery = <<-SQL
      SELECT id, message, updated_at FROM infos ORDER BY updated_at DESC
    SQL

    @info = Info.find_by_sql([sqlQuery])
    respond_to do |format|
        format.json { render :json => @info.to_json() }
    end
  end

  def doInfoAdd
    render :nothing => true

    sqlQuery = <<-SQL
     SELECT id FROM users
    SQL

    message = params[:message]
    if message then
      info = Info.new
      info.message = message
      info.save

      # Do Alert notification call.
      #deviceId = ''
      #devices = []
      #uid = 0
      #@users = User.find_by_sql([sqlQuery])
      #@users.each do |user|
      #  uid = user.id 
      #  @devices = Device.where(:my_id => uid)
      #  @devices.each do |device|
      #    deviceId = device.deviceId
      #    deviceId = deviceId.gsub(/[<> ]/, '')
      #    devices << deviceId
      #  end
      #end

      #if deviceId then
      #  notice = MyNotice.new
      #  notice.send(devices, message, "information")
      #end
      ios_notice(message, "information")
      android_notice(message)
    end
  end

  def doInfoDelete
    render :nothing => true

    #ids = params[:chats]
    #idArray = ids.split(",")

    #Chat.delete(idArray)

    ids = params[:infos]
    p ids
    idArray = ids.split(",")
    Info.delete(idArray)
  end



  def userEnabled
    render :nothing => true

    ids = params[:users]
    idArray = ids.split(",")

    @users = User.find(idArray)
    @users.each do |user|
      user.freezeAccount = false
      user.save
    end

  end

  def userDisabled
    render :nothing => true

    ids = params[:users]
    idArray = ids.split(",")
    @users = User.find(idArray)
    @users.each do |user|
      user.freezeAccount = true
      user.save
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
