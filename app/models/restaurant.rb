class Restaurant < ApplicationRecord
  has_many :meals, dependent: :destroy
  has_many :ordered_meals
  has_many :orders
  belongs_to :user

  mount_uploader :profile_image, ImageUploader
  mount_uploader :banner_image, ImageUploader

  searchkick
end
