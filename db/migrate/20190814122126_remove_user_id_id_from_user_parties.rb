class RemoveUserIdIdFromUserParties < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_parties, :user_id_id, :integer
    remove_column :user_parties, :party_id_id, :integer

  end
end
