class RatingsController < ApplicationController

  before_action :check_logged_in

  def create
    @rating = current_user.ratings.build(rating_params)
    @rating.product_id = params[:product_id]
    @rating.save

    redirect_to product_path(params[:product_id])
  end

  def destroy
    @rating = Rating.find params[:id]
    @rating.destroy
    redirect_to product_path(params[:product_id])
  end

  private

  def check_logged_in
    unless current_user
      redirect_to '/login'
    end
  end

  def rating_params
    params.require(:rating).permit(
      :description,
      :rating,
      :user_id,
      :product_id,
      :id
    )
  end

end
