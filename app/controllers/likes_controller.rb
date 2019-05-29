class LikesController < ApplicationController

  def create
    @like = Like.new(like_params)
    @like.user = current_user
    @like.product = Product.find(params[:id])

    authorize @like

    if @like.save!
      redirect_to private_profile_path(current_user)
    else
      render :new
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to product_path
  end

  private

  def like_params
    # params.require(:like).permit( )
  end
end
