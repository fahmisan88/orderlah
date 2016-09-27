class Restaurant < ApplicationRecord
  has_many :meals
  belongs_to :user
  mount_uploader :image, ImageUploader
  searchkick
end
