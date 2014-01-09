class AlertServiceController < ApplicationController

  def getAlert
    myId = 0
    @myInfo = User.where(:email => params[:myId])
    @myInfo.each do |my|
      myId = my.id
    end

    resetAlertCount(myId)

    @alerts = Alert.find(:all, :conditions => ["user_id = ?", myId], :order => "id ASC")
    respond_to do |format|
      format.json { render :json => @alerts }
    end
  end

  def resetAlertCount(myId)
    if NotificationCount.where(:my_id => myId).exists? then
      @counts = NotificationCount.where(:my_id => myId)
      @counts.each do |c|
        c.alertCount = 0
        c.save
      end
    end
  end

end
