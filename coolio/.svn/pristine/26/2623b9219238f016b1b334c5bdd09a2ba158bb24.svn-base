class Device < ActiveRecord::Base
  # attr_accessible :title, :body
	attr_accessible :id, :my_id, :deviceId, :os
	belongs_to :user, :class_name => 'User', :foreign_key => :my_id
end
