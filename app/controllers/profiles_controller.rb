class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:public_profile, :profiles]

  def private_profile
    @user = current_user
    authorize :profile, :private_profile?

    @products = Product.where(user: @user)
  end

  def public_profile
    @user = User.find(params[:id])
    @current = current_user
    authorize :profile, :public_profile?

    @products = Product.where(user: @user)
  end

  def profiles
    @profiles = User.where(user_type: 'creator')
    authorize :profile, :profiles?
  end
end
