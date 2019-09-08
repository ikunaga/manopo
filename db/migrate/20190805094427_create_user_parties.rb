class CreateUserParties < ActiveRecord::Migration[5.2]
  def change
    create_table :user_parties, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :user_id, null: false
      t.integer :party_id, null: false
      t.timestamps
    end
  end
end
