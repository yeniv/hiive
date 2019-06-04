class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:public_profile, :profiles]

  def private_profile
    @user = current_user
    authorize :profile, :private_profile?

    @products = Product.where(user: @user)

    flash.now[:notice] = "👋 Hi #{@user.first_name}, this is your private profile. You're the only one who has access to this page. Enjoy!" if @user.products.empty?
  end

  def public_profile
    @user = User.find_by_store_url(params[:store_url].downcase)
    @current = current_user
    authorize :profile, :public_profile?

    @products = Product.where(user: @user)
  end

  def profiles
    @profiles = User.where(user_type: 'creator')
    authorize :profile, :profiles?
  end
end
