class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:public_profile]

  def private_profile
    @user = current_user
    authorize :profile, :private_profile?

    unless params[:link].nil?
      product_params = Scraper.go(params[:link])

      product_params.each do |params|
        new_product = Product.new(params)
        new_product.remote_photo_url = params[:photo]
        new_product.user = @user
        new_product.save!
      end
    end

    @products = Product.where(user: @user)
  end

  def public_profile
    @user = User.find(params[:id])
    authorize :profile, :public_profile?

    @products = Product.where(user: @user)
  end
end
