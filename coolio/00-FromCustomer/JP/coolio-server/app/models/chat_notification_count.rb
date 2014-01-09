class ChatNotificationCount < ActiveRecord::Base
  # attr_accessible :title, :body
        attr_accessible :id, :my_id, :countValue
	belongs_to :user, :class_name => 'User', :foreign_key => :user_id

	def my_id=(user)
		super
	end
	
end
