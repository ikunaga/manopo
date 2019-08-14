class RemoveUserIdFromChatMessage < ActiveRecord::Migration[5.2]
  def change
    remove_column :chat_messages, :user_id, :string
    remove_column :chat_messages, :chatroom_id, :string
  end
end
