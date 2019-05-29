class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @products = policy_scope(Product)
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user

    authorize @product

    if @product.save!
      redirect_to private_profile_path(current_user)
    else
      render :new
    end
  end

  private

  def product_params
    # params.require(:product).permit( )
  end
end
