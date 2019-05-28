class Product < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :product_categories
  has_many :likes

  mount_uploader :photo, PhotoUploader
end
