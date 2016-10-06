class Order < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many :meals, through: :ordered_meals
  has_many :ordered_meals

  enum status: [:Received, :Processing, :Completed]
end
