class LikesController < ApplicationController
  def create
    @like = Like.new
    @like.user = current_user
    @like.product = Product.find(params[:product_id])

    authorize @like

    if @like.save!
      redirect_to private_profile_path(current_user)
    else
      render :new
    end
  end

  def destroy
    @like = Like.find(params[:id])

    authorize @like

    @like.destroy
    redirect_to private_profile_path(current_user)
  end
end
