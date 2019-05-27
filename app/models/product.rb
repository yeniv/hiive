class Product < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :product_categories
  has_many :likes
end
