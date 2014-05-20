class Comment < ActiveRecord::Base
	belongs_to :blogpost 
	belongs_to :user
end
