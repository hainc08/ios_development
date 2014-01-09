
class CronBatch

  def self.deletedUsersExecute
    sqlQuery = <<-SQL
      SELECT DISTINCT id, email FROM users WHERE DATEDIFF(NOW(), updated_at) >= 100 OR freezeAccount = true
    SQL
    @users = User.find_by_sql([sqlQuery])

    p @users

    delId = 0
    @users.each do |user|
      delId = user.id

      if delId != 0 then
        Friend.delete_all(["my_id = ? OR user_id = ?", delId, delId])
        SilentMatch.delete_all(["my_id = ? OR user_id = ?", delId, delId])
        Match.delete_all(["my_id = ? OR user_id = ?", delId, delId])
        Block.delete_all(["my_id = ? OR user_id = ?", delId, delId])
        Footprint.delete_all(["my_id = ? OR user_id = ?", delId, delId])
        FriendRequest.delete_all(["my_id = ? OR user_id = ?", delId, delId])
        Report.delete_all(["my_id = ? OR user_id = ?", delId, delId])
        ChatNotificationCount.delete_all(["my_id = ? OR user_id = ?", delId, delId])
        Chat.delete_all(["my_id = ? OR user_id = ?", delId, delId])

        History.delete_all(["my_id = ?", delId])
        NotificationCount.delete_all(["my_id = ?", delId])
        Device.delete_all(["my_id = ?", delId])
        Masterpassword.delete_all(["my_id = ?", delId])

        Alert.delete_all(["user_id = ?", delId])
        User.delete(["id = ?", delId])
      end
    end
  end

  def self.setOfflineUsers
    sqlQuery = <<-SQL
      SELECT DISTINCT id, online FROM users WHERE updated_at > ? AND online = true  AND freezeAccount = false
    SQL

    @users = User.find_by_sql([sqlQuery, 10.minute])
    @users.each do |user|
      user.online = false
      user.save
    end
  end

  def self.resetInfoCount
    sqlQuery = <<-SQL
      SELECT id FROM users
    SQL

    myId = 0
    @users = User.find_by_sql([sqlQuery])
    @users.each do |user|
      myId = user.id
      @counts = NotificationCount.where(:my_id => myId)
      @counts.each do |c|
        c.infomationCount = 0
        c.save
      end
    end
  end


end
