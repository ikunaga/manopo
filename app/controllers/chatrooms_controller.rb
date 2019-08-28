class ChatroomsController < ApplicationController

	def index
		@rooms = current_user.chatrooms
	end

	def show
		@room = Chatroom.find(params[:id])
		@messages = @room.chat_messages
	end
end


