class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.string :party_name, null: false
      t.datetime :event_date
      t.string :place
      t.string :contents
      t.integer :organizer_user_id, null: false
      t.integer :category_id, null: false
      t.timestamps
    end
  end
end
