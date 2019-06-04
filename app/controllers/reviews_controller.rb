class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.user = current_user
    product = Product.find(params[:product_id])
    @review.product = product

    authorize @review

    if @review.save
      redirect_to product_path(product)
      flash[:notice] = "🎉 thanks for the review!"
    else
      redirect_back(fallback_location: root_path)
      flash[:alert] = "⚡️ hmmmm, something went wrong. Please try adding your review again."
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path
    flash[:notice] = "☠️ review deleted!"
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
