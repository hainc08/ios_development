class Friend < ActiveRecord::Base
  #attr_accessible :from_user_id, :to_user_id 
	attr_accessible :id, :my_id
	belongs_to :user, :class_name => 'User', :foreign_key => :my_id
 	belongs_to :user

	def my_id=(user)
		super
	end
end
