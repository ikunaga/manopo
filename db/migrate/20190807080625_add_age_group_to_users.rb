class AddAgeGroupToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :age_group, :integer
  end
end
