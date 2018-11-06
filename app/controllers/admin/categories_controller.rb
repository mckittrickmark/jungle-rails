class Admin::CategoriesController < ApplicationController

  # Get to the all categories
  def index
    @categories = Category.all
  end

  # GET to the form view.
  def new
    @category = Category.new
  end

  # POST to the database.
  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private
  def category_params
      params.require(:category).permit(
      :name
    )
  end




end
