class CategoriesController < ApplicationController
  before_action :set_user

  def index
    @categories = current_user.categories.includes(:transactions).order(created_at: :desc)
  end

  def show
    @category = current_user.categories.find(params[:id])
    @transactions = @category.transactions.order(created_at: :desc)
    @total_amount = @transactions.sum(:amount)
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      redirect_to @category, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end

  private

  def set_user
    @user = current_user
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
