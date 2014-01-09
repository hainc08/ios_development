class ReportServiceController < ApplicationController
	def setReport
		render :nothing => true
		
		id = params[:myId]
		command = params[:commandId]
		reportId = params[:reportId]

    uid = 0
    @users = User.where(:email => id)
    @users.each do |user|
        uid = user.id
    end

		rid = 0
    @users = User.where(:email => reportId)
    @users.each do |user|
        rid = user.id
    end

		report = Report.new
		report.my_id = uid
		report.command = command
		report.user_id = rid
		report.save

    removeFriendList(uid, rid)
    setBlockList(uid, rid)

		countValue = 0
		@reports = Report.find_by_sql(["SELECT COUNT(distinct user_id) AS value FROM reports WHERE reports.user_id = ?", rid])
		@reports.each do |report|
			countValue = report.value
		end

		if countValue >= 10 then
			@users = User.where(:id => rid)
			@users.each do |user|
				user.freezeAccount = true
				user.save
			end
		end
  
	end

	def setBlockList(myId, userId)
    block = Block.new
    block.my_id = myId
    block.user_id = userId
    block.save		
	end

  def removeFriendList(myId, userId)

    friendId = 0
    if Friend.where(:my_id => myId).where(:user_id => userId).exists? then
      @friends = Friend.where(:my_id => myId).where(:user_id => userId)
      @friends.each do |friend|
        friendId = friend.id
        Friend.destroy(friendId)
      end
    end

    friendId = 0
    if Friend.where(:my_id => userId).where(:user_id => myId).exists? then
      @friends = Friend.where(:my_id => userId).where(:user_id => myId)
      @friends.each do |friend|
        friendId = friend.id
        Friend.destroy(friendId)
      end
    end


    silentMatchId = 0
    if SilentMatch.where(:my_id => myId).where(:user_id => userId).exists? then
      @silentMatches = SilentMatch.where(:my_id => myId).where(:user_id => userId)
      @silentMatches.each do |silentMatch|
        silentMatchId = silentMatch.id
        SilentMatch.destroy(silentMatchId)
      end
    end

    silentMatchId = 0
    if SilentMatch.where(:my_id => userId).where(:user_id => myId).exists? then
      @silentMatches = SilentMatch.where(:my_id => userId).where(:user_id => myId)
      @silentMatches.each do |silentMatch|
        silentMatchId = silentMatch.id
        SilentMatch.destroy(silentMatchId)
      end
    end


    matchId = 0
    if Match.where(:my_id => myId).where(:user_id => userId).exists? then
        @matches = Match.where(:my_id => myId).where(:user_id => userId)
        @matches.each do |match|
          matchId = match.id
          Match.destroy(matchId)
        end
    end

    matchId = 0
    if Match.where(:my_id => userId).where(:user_id => myId).exists? then
        @matches = Match.where(:my_id => userId).where(:user_id => myId)
        @matches.each do |match|
            matchId = match.id
            Match.destroy(matchId)
        end
    end


    friendRequestId = 0
    if FriendRequest.where(:my_id => myId).where(:user_id => userId).exists? then
      @frequests = FriendRequest.where(:my_id => myId).where(:user_id => userId)
      @frequests.each do |request|
        friendRequestId = request.id
        FriendRequest.destroy(friendRequestId)
      end
    end

    friendRequestId = 0
    if FriendRequest.where(:my_id => userId).where(:user_id => myId).exists? then
      @frequests = FriendRequest.where(:my_id => userId).where(:user_id => myId)
      @frequests.each do |request|
        friendRequestId = request.id
        FriendRequest.destroy(friendRequestId)
      end
    end

  # End method
  end

end

