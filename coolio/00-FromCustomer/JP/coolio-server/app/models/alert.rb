class Alert < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :id, :message
 	belongs_to :user

	def my_id=(user)
		super
	end
end
