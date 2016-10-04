class RestaurantApplication < ApplicationRecord
  belongs_to :user
  has_one :restaurant
  has_one :phone_number

  mount_uploader :restaurant_doc, ImageUploader

end
