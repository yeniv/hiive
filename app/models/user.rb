class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :product_likes, through: :products, source: :user
  has_many :socials

  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :user_type, presence: true

  mount_uploader :photo, PhotoUploader
end
