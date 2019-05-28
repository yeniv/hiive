class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:public_profile]

  def private_profile
    @user = current_user
    authorize :profile, :private_profile?
  end

  def public_profile
    @user = User.find(params[:id])
    authorize :profile, :public_profile?
  end
end
