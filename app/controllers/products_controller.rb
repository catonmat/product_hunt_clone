class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save!
  end

  private

  def product_params
    params.require(:product).permit(:test_prdouct_name, :test_product_tagline)
  end
end
