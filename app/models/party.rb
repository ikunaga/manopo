class Party < ApplicationRecord
	has_many :users, through: :user_parties
    has_many :user_parties
    accepts_nested_attributes_for :user_parties
    belongs_to :category
        def user_parties_by?(user)
          user_parties.where(user_id: user.id).exists?
        end
end
