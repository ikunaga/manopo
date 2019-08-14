class CreateChatroomUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :chatroom_users do |t|
      t.integer :user_id, null: false
      t.integer :chatroom_id, null: false
      t.timestamps
    end
  end
end
