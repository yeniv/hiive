class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:public_profile, :profiles]

  def private_profile
    @user = current_user
    authorize :profile, :private_profile?

    ## new scraper
    # Scraper.single_job(params[:link], @user.id) unless params[:link].nil?

    @products = Product.where(user: @user)

    flash.now[:notice] = "👋 Hi #{@user.first_name}! Welcome to is your new store. Add some products to get started." if @user.products.empty?
  end

  def public_profile
    @user = User.find_by_store_url(params[:store_url])
    @current = current_user
    authorize :profile, :public_profile?

    @products = Product.where(user: @user)
  end

  def profiles
    @profiles = User.where(user_type: 'creator')
    authorize :profile, :profiles?
  end
end
