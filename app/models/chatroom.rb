class Chatroom < ApplicationRecord
	has_many :chat_messages
	has_many :chatroom_users
	has_many :users, through: :chatroom_users
    accepts_nested_attributes_for :chatroom_users
end
