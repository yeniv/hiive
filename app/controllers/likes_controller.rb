class LikesController < ApplicationController
  def create
    @like = Like.new
    @like.user = current_user
    @like.product = Product.find(params[:product_id])

    authorize @like

    if @like.save!
      # redirect_to private_profile_path(current_user)
      respond_to do |format|
        format.html { private_profile_path(current_user) }
        format.js
      end
    else
      # render :new
      respond_to do |format|
        format.html { private_profile_path(current_user) }
        format.js
      end
    end
  end

  def destroy
    @like = Like.find(params[:id])

    authorize @like

    if @like.destroy
      # redirect_to private_profile_path(current_user)
      respond_to do |format|
          format.html { private_profile_path(current_user) }
          format.js
      end
    else
      flash[:alert] = "Something went wrong, please try again"
    end
  end
end
