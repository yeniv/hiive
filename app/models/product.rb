class Product < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :product_categories
  has_many :likes

  validates :referal_link, presence: true, format: {with:/(https?:)?(www\.)?([a-zA-Z0-9_%]*)\b\.[a-z]{2,4}(\.[a-z]{2})?((.[a-zA-Z0-9_%]*)+)?(\.[a-z]*)?/, message: "please enter the url in correct format"}
  validates :title, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :description, presence: true
  validates :brand_name, presence: true
  validates :seller, presence: true

  mount_uploader :photo, PhotoUploader
end
