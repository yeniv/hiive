class Product < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :product_categories, dependent: :destroy
  has_many :likes, dependent: :destroy

  mount_uploader :photo, PhotoUploader
end
