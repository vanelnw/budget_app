class TransactionsController < ApplicationController
  before_action :set_user

  def index
    @transactions = Transaction.all
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
    @categories = current_user.categories
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user = current_user # assuming you have authentication in your app
    @category = Category.find(params[:transaction][:category_id]) # add this line
    puts @category
    if @transaction.save
      redirect_to @category, notice: 'Category was successfully created.'
    else
      @categories = current_user.categories # reassign categories to instance variable for rendering the form
      render :new
    end
  end

  def destroy
    @transaction.destroy
    redirect_to transactions_url, notice: 'Transaction was successfully destroyed.'
  end

  private

  def set_user
    @user = current_user
  end

  def transaction_params
    params.require(:transaction).permit(:name, :amount, :category_id)
    # the category_ids array is used to assign categories to the transaction through the many-to-many association
  end
end
