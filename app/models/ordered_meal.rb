class OrderedMeal < ApplicationRecord
  belongs_to :order
  belongs_to :meal
end
