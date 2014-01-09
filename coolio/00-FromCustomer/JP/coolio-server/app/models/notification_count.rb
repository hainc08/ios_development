class NotificationCount < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :id, :friendRequestCount, :matchCount, :footPrintCount, :alertCount, :infomationCount, :my_id
	belongs_to :user, :class_name => 'User', :foreign_key => :my_id

	def my_id=(user)
		super
	end
end
