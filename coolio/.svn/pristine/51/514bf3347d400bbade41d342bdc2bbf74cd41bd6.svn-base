class HistoryServiceController < ApplicationController

  def getHistory
    id = params[:myId]

    uid = 0
    @users = User.where(:email => id)
    @users.each do |user|
        uid = user.id
    end

    #@histories = History.where(:my_id => uid)
    #@histories = History.find(:all, :conditions => ["user_id = ?", uid], :order => "id ASC").uniq
    sqlQuery = <<-SQL
        SELECT DISTINCT count(histories.id) AS countValue, email, nickname, age, height, weight,
               lookingLover,lookingFriend,lookingEPal,lookingMPal,lookingTPal,
               lookingCircle,lookingRoommate,lookingBPartner,lookingFriendWithBenefits,
               picture1,
               max(histories.updated_at) AS updated_at
        FROM users INNER JOIN histories ON histories.my_id = users.id
        WHERE histories.user_id = ?
        AND
        (freezeAccount != NULL OR freezeAccount = false)
        AND
        users.id NOT IN (SELECT blocks.user_id FROM blocks, users WHERE users.id = blocks.user_id AND blocks.my_id =  ?)
        AND
        users.id NOT IN (SELECT blocks.my_id FROM blocks, users WHERE users.id = blocks.user_id AND blocks.user_id =  ?)
        AND
        users.email NOT IN (SELECT blacklists.email FROM blacklists)
        GROUP BY histories.my_id ORDER BY histories.updated_at DESC LIMIT 30;
    SQL
    @histories = History.find_by_sql([sqlQuery, uid, uid, uid])

    respond_to do |format|
      format.json { render :json => @histories.to_json() }
    end
  end

  def setHistory
    render :nothing => true

    id = 0
    @myInfo = User.where(:email => params[:myId])
    @myInfo.each do |my|
        id = my.id
    end
    
    historyId = 0
    @historyInfo = User.where(:email => params[:historyId])
    @historyInfo.each do |history|
        historyId = history.id
    end 

    if History.where(:my_id => historyId).where(:user_id => id).exists? then
        @histories = History.where(:my_id => historyId).where(:user_id => id)
        @histories.each do |history|
          history.touch
          history.save
        end
    else
      history = History.new
      history.my_id = historyId
      history.user_id = id
      history.save
    end
  end


end
