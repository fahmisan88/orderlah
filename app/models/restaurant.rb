class Restaurant < ApplicationRecord
  has_many :meals, dependent: :destroy
  has_many :ordered_meals
  has_many :orders
  belongs_to :user
  belongs_to :restaurant_application

  mount_uploader :profile_image, ImageUploader
  mount_uploader :banner_image, ImageUploader

  searchkick

  geocoded_by :full_address   # can also be an IP address

  def full_address
    [address, city, postcode, state, country].compact.join(', ')
  end

  after_validation :geocode        # auto-fetch coordinates
end
