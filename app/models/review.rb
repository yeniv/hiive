class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :description, presence: true
  validates :rating, presence: true, :inclusion => { :in => 0..5 }
end
