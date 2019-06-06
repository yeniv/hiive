class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :discover]
  before_action :top_5_products, only: [:discover]
  before_action :top_creators, only: [:discover]
  before_action :random_products, only: [:discover]

  def home
  end

  def discover
  end

  private

  def top_5_products
   product_list = Like.group(:product_id).count
   top_products = product_list.sort_by { |_, value| value }.last(5).reverse.to_h
   @top_5_products = top_products.map { |item| Product.find(item[0]) }
  end

  def top_creators
    @top_creators = User.where(user_type: 'creator').first(8)
  end

  def random_products
    @random_products = Product.all.sample(4)
  end
end
