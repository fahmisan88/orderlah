class Restaurant < ApplicationRecord
  has_many :meals
  belongs_to :user
end
