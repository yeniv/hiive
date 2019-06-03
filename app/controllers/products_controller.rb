class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

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
  end

  def show
    @product = Product.find(params[:id])
    authorize @product
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
    else
      render :new
    end
  end

  def destroy
    @product = Product.find(params[:id])
    authorize @product
    @product.destroy
    redirect_to private_profile_path(current_user)
  end

  private

  def product_params
    params.require(:product).permit(:title, :brand, :price, :description, :category, :referal_link, :photo, :seller)
  end
end
