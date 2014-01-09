class Footprint < ActiveRecord::Base
  # attr_accessible :title, :body
	attr_accessible :id, :my_id
	belongs_to :user, :class_name => 'User', :foreign_key => :my_id
 	belongs_to :user

	def my_id=(user)
		super
	end
end