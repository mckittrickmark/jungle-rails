class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    if current_user
      @rating = current_user.ratings.build
    end
  end

end
