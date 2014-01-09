class BlockServiceController < ApplicationController

  def doBlock

    id = 0
    @myInfo = User.where(:email => params[:myId])
    @myInfo.each do |my|
        id = my.id
    end
    
    blockId = 0
    @blockInfo = User.where(:email => params[:blockId])
    @blockInfo.each do |block|
        blockId = block.id
    end 

    retString = "success"

    if Block.where(:my_id => id).where(:user_id => blockId).exists? then
        retString = "success"
    else
        retString = "failure"
    end

    respond_to do |format|
      format.json { render :json => retString }
    end
  end

  def getBlocks
    
    id = params[:myId]

    uid = 0
    @users = User.where(:email => id)
    @users.each do |user|
        uid = user.id
    end

    sqlQuery = "SELECT users.* FROM users INNER JOIN blocks ON blocks.user_id = users.id WHERE blocks.my_id = ? ORDER BY blocks.id DESC"
    #@blocks = Block.find(:all, :conditions => ["my_id = ?", uid], :order => "id ASC")
    @blocks = Block.find_by_sql([sqlQuery, uid])
    respond_to do |format|
      format.json { render :json => @blocks.to_json(:include => :user) }
    end

  end

  def setBlock
    render :nothing => true

    myId = 0
    @myInfo = User.where(:email => params[:myId])
    @myInfo.each do |my|
        myId = my.id
    end
    
    userId = 0
    @userInfo = User.where(:email => params[:blockId])
    @userInfo.each do |user|
        userId = user.id
    end

    removeFriendList(myId, userId)

    block = Block.new
    block.my_id = myId
    block.user_id = userId
    block.save
  end

  def setBlockOff
    render :nothing => true

    id = 0
    @myInfo = User.where(:email => params[:myId])
    @myInfo.each do |my|
        id = my.id
    end
    
    blockId = 0
    @blockInfo = User.where(:email => params[:blockId])
    @blockInfo.each do |block|
        blockId = block.id
    end

    blockRecordId = 0
    if Block.where(:my_id => id).where(:user_id => blockId).exists? then
      @blocks = Block.where(:my_id => id).where(:user_id => blockId)
      @blocks.each do |block|
        blockRecordId = block.id
      end

      if blockRecordId != 0 then
        Block.destroy(blockRecordId)
      end
    end
  end

  def removeFriendList(myId, userId)

    friendId = 0
    if Friend.where(:my_id => myId).where(:user_id => userId).exists? then
      @friends = Friend.where(:my_id => myId).where(:user_id => userId)
      @friends.each do |friend|
        friendId = friend.id
        Friend.destroy(friendId)
      end

      #if friendId != 0 then
      #  Friend.destroy(friendId)
      #end
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

      #if silentMatchId != 0 then
      #  SilentMatch.destroy(silentMatchId)
      #end
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

        #if matchId != 0 then
        #    Match.destroy(matchId)
        #end
    end

    matchId = 0
    if Match.where(:my_id => userId).where(:user_id => myId).exists? then
        @matches = Match.where(:my_id => userId).where(:user_id => myId)
        @matches.each do |match|
            matchId = match.id
            Match.destroy(matchId)
        end

        #if matchId != 0 then
        #    Match.destroy(matchId)
        #end
    end


    friendRequestId = 0
    if FriendRequest.where(:my_id => myId).where(:user_id => userId).exists? then
      @frequests = FriendRequest.where(:my_id => myId).where(:user_id => userId)
      @frequests.each do |request|
        friendRequestId = request.id
        FriendRequest.destroy(friendRequestId)
      end

      #if friendRequestId != 0 then
      #  FriendRequest.destroy(friendRequestId)
      #end
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

