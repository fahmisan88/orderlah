class Meal < ApplicationRecord
  belongs_to :restaurant
  has_many :orders, through: :ordered_meals

  mount_uploader :image, ImageUploader
end
