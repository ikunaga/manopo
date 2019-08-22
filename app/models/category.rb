class Category < ApplicationRecord
	has_many :skills, dependent: :destroy
	has_many :parties, dependent: :destroy
end
