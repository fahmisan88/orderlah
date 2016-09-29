class RestaurantApplication < ApplicationRecord
  belongs_to :user
  has_one :restaurant

  mount_uploader :restaurant_doc, ImageUploader

end
