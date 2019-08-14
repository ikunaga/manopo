class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name_kana, :string
    add_column :users, :first_name_kana, :string
    add_column :users, :location, :string
    add_column :users, :image_id, :text
    add_column :users, :age, :string
    add_column :users, :address, :string
    add_column :users, :phone_number, :string
    add_column :users, :is_deleted, :boolean
    add_column :users, :deleted_at, :datetime, index: true
  end
end

