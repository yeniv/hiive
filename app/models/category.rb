class Category < ApplicationRecord
  has_many :product_categories
  validates :name, presence: true # joao
end
