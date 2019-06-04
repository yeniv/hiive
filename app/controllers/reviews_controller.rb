class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.user = current_user
    product = Product.find(params[:product_id])
    @review.product = product

    authorize @review

    if @review.save
      redirect_to product_path(product)
      flash[:notice] = "Review added succesfully"
    else
      redirect_back(fallback_location: root_path)
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
    params.require(:review).permit(:description, :rating)
  end
end
