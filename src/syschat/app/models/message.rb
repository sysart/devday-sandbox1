class Message < ActiveRecord::Base
	belongs_to :chatroom
	validates :chatroom_id, presence: true
end
