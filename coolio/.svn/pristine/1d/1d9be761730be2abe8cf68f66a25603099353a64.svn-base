#! ruby -Ku
# -*- coding: utf-8 -*-
#
# Ruby 1.9 execution
# Android Push Notification Test
#

require 'json'
require 'net/http'
require 'uri'

class AndroidNotice

  #ServerAPI key
  API_KEY = "[Server API Key]"
 
  # send(deviceTokens, message, command)
  def send(deviceTokens, message)

    url = URI.parse("https://android.googleapis.com/gcm/send")
  
    message_data = {}
    message_data["registration_ids"] = deviceTokens
    message_data["collapse_key"] = "collapse_key"
    message_data["delay_while_idle"] = true
    message_data["time_to_live"] = 240
    message_data["data"] = message
  
    headers = { "Content-Type" => "application/json", "Authorization" => "key=" + API_KEY }
  
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    # 動作確認のみ行いたいので、一時的にOpenSSL::SSL::VERIFY_NONE
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  
    http.post(url.path, message_data.to_json, headers)
  end

end
