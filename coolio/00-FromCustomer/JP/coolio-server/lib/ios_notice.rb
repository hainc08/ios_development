require 'apns'

class IosNotice
  def send(deviceTokens, message, command)
    # 本番では 'gateway.push.apple.com'
    APNS.host = 'gateway.push.apple.com'
    APNS.pem = Rails.root.join("certKeyFiles","ck_production.pem")
    APNS.pass = 'Hoeesc99$'
    APNS.port = 2195

    notifications = []
    for token in deviceTokens
      notifications << APNS::Notification.new(token, :alert => message, :badge => 1, :sound => 'default', :other => {:sent => command})
    end

    APNS.send_notifications(notifications)
  end

  def sendChatMessage(deviceTokens, message, command, userId)
    # 本番では 'gateway.push.apple.com'
    #APNS.host = 'gateway.sandbox.push.apple.com'
    APNS.host = 'gateway.push.apple.com'
    APNS.pem = Rails.root.join("certKeyFiles","ck_production.pem")
    APNS.pass = 'Hoeesc99$'
    APNS.port = 2195

    notifications = []
    for token in deviceTokens
      notifications << APNS::Notification.new(token, :alert => message, :badge => 1, :sound => 'default', :other => {:sent => command, :user => userId})
    end
    APNS.send_notifications(notifications)
  end

end
