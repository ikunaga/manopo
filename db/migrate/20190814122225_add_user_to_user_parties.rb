class AddUserToUserParties < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_parties, :user, foreign_key: true, index: true
    add_reference :user_parties, :party, foreign_key: true, index:true
  end
end
