class ChatroomsController < ApplicationController

	def index
		@rooms = Chatroom.all.order(:id)
	end

	def show
		@room = Chatroom.find(params[:id])
		@messages = @room.chat_messages
	end
end


