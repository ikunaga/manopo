class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_channel_#{params['chatroom_id']}" 
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def post(data)
    ChatMessage.create!(message: data['chat_message'], user_id: current_user.id, chatroom_id: data['chatroom_id'])
  end

end


