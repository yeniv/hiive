class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.product = Product.find(params[:id])

    authorize @review

    if @review.save!
      redirect_to private_profile_path(current_user)
      flash[:notice] = "Review added succesfully"
    else
      render :new
      flash[:alert] = "Review was not added, please try again"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path
  end

  private

  def review_params
    # params.require(:review).permit( )
  end
end
