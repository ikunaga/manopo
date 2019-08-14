class ChatChannel < ApplicationCable::Channel
  def subscribed
    	stream_from "chat_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def post(data)
    ActionCable.server.broadcast 'chat_channel', chat_message: data['chat_message']
  end

  def post(data)
    ChatMessage.create! message: data['chat_message']
  end

end