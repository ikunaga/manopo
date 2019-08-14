class CreateUserParties < ActiveRecord::Migration[5.2]
  def change
    create_table :user_parties do |t|
      t.integer :user_id, null: false
      t.integer :party_id, null: false
      t.timestamps
    end
  end
end
