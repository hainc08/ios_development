require 'date'

class FootPrintServiceController < ApplicationController

  def getFootPrint
    id = params[:myId]

    myId = 0
    @users = User.where(:email => id)
    @users.each do |user|
        myId = user.id
    end

    sqlQuery = <<-SQL
        SELECT DISTINCT
                email,nickname,age,height,weight, '' AS updated_at,
                lookingLover,lookingFriend,lookingEPal,lookingMPal,lookingTPal,lookingCircle,lookingRoommate,lookingBPartner,lookingFriendWithBenefits,
                picture1
         FROM users LEFT JOIN footprints ON footprints.user_id = users.id
         WHERE users.id IN 
         (SELECT footprints.my_id FROM footprints WHERE footprints.user_id = ?) 
         AND DATEDIFF(NOW(), footprints.updated_at) <= 30
         AND users.email != ?
         AND (users.freezeAccount != NULL OR users.freezeAccount = false)
         AND users.id NOT IN (SELECT blocks.user_id FROM blocks, users WHERE users.id = blocks.user_id AND blocks.my_id =  ?)
         AND users.id NOT IN (SELECT blocks.my_id FROM blocks, users WHERE users.id = blocks.user_id AND blocks.user_id =  ?)
         AND users.email NOT IN (SELECT blacklists.email FROM blacklists)
         ORDER BY footprints.updated_at DESC
    SQL
    # AND footprints.updated_at >= ? AND footprints.updated_at <= ?

    @footPrints = Footprint.find_by_sql([sqlQuery, myId, id, myId, myId])
    # Footprint.find_by_sql([sqlQuery, myId, 30.day.ago, Time.now, id, myId, myId])

    sqlQuery = <<-SQL
        SELECT updated_at FROM footprints
          WHERE footprints.my_id = (SELECT id FROM users WHERE email = ?)
          AND footprints.user_id = (SELECT id FROM users WHERE email = ?)
    SQL

    email = nil
    @footPrints.each do |foot|
        email = foot.email
        if email != id then
            @fp = Footprint.find_by_sql([sqlQuery, email, id])
            @fp.each do |f|
               foot.updated_at = f.updated_at
            end
        end
    end


    respond_to do |format|
      format.json { render :json => @footPrints.to_json() }
    end
  end

  def setFootPrint
    render :nothing => true

    #myId = params[:myId]
    #footPrintId = params[:footPrintId]

    id = 0
    @myInfo = User.where(:email => params[:myId])
    @myInfo.each do |my|
        id = my.id
    end
    
    footPrintId = 0
    @footPrints = User.where(:email => params[:footPrintId])
    @footPrints.each do |footPrintInfo|
        footPrintId = footPrintInfo.id
    end 

    if Block.where(:my_id => footPrintId).where(:user_id => id).exists? then
      return
    end

    if Footprint.where(["my_id = ? AND user_id = ? AND updated_at >= ?", id, footPrintId, 30.day.ago]).exists? then
      return
    end

    if Footprint.where(["my_id = ? AND user_id = ?", id, footPrintId]).exists? then
        @footPrints = Footprint.where(["my_id = ? AND user_id = ?", id, footPrintId])
        @footPrints.each do |footPrint|
          footPrint.updated_at = DateTime.now
          footPrint.save
        end

        if NotificationCount.where(:my_id => footPrintId).exists? then
            @counts = NotificationCount.where(:my_id => footPrintId)
            @counts.each do |c|
                c.footPrintCount = c.footPrintCount + 1
                c.save
            end
        else
            c = NotificationCount.new
            c.my_id = footPrintId
            c.footPrintCount = 1
            c.save
        end

    else
        footPrint = Footprint.new
        footPrint.my_id = id
        footPrint.user_id = footPrintId
        footPrint.save
        
        if NotificationCount.where(:my_id => footPrintId).exists? then
            @counts = NotificationCount.where(:my_id => footPrintId)
            @counts.each do |c|
                c.footPrintCount = c.footPrintCount + 1
                c.save
            end
        else
            c = NotificationCount.new
            c.my_id = footPrintId
            c.footPrintCount = 1
            c.save
        end
    end
  end


end
