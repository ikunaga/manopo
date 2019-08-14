class ChatsController < ApplicationController

	def show
		@messages = ChatMessage.all
	end
end
