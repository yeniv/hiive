class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show,]
  skip_before_action :verify_authenticity_token

  def index
    if params[:query].present?
      sql_query = " \
      products.title @@ :query \
      OR products.description @@ :query \
      OR products.brand @@ :query \
      OR products.category @@ :query \
      OR products.seller @@ :query \
      OR users.first_name @@ :query \
      OR users.last_name @@ :query \
      "
      @products = policy_scope(Product).joins(:user).where(sql_query, query: "%#{params[:query]}%")
    else
      @products = policy_scope(Product)
    end
    if params[:cat].present?
      @products = @products.where(category: params[:cat])
    end
  end

  def show
    @product = Product.find(params[:id])
    authorize @product
    @review = Review.new
    @product_reviews = Review.where(product_id: @product.id)
  end

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    authorize @product

    if @product.save
      redirect_to private_profile_path
      flash[:notice] = "🎉 #{@product.title} added to your store!"
    else
      flash[:alert] = "⚡️ We need a little more info. Please complete all highlighted product fields!"
      render :new
    end
  end

  def scrape
    authorize :product, :scrape?

    unless params[:link].nil?
      product_params = Scraper.validator(params[:link])

      product_params.each do |param|
        ScrapeJob.set(wait: 5.seconds).perform_later.(param, current_user.id)
      end
    end
    redirect_to private_profile_path
  end

  def destroy
    @product = Product.find(params[:id])
    authorize @product
    @product.destroy
    redirect_to private_profile_path(current_user)
    flash[:alert] = "⚡️ #{@product.title} was removed from your store!"
  end

  private

  def product_params
    params.require(:product).permit(:title, :brand, :price, :description, :category, :referal_link, :photo, :seller)
  end
end
