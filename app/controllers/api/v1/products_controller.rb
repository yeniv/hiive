class Api::V1::ProductsController < Api::V1::BaseController
  def index
    user = User.find(params[:user_id])
    @user_products = policy_scope(Product).where(user: user)
  end
end
