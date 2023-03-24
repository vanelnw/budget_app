require 'rails_helper'

RSpec.describe Transaction, type: :model do
  before :each do
    @user = User.create!(name: 'Tom', email: 'Tom@gmail.com', password: '123456')
    @transaction = Transaction.new(name: 'Transaction 1', amount: 10, user: @user)
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(@transaction).to be_valid
    end

    it 'is invalid without a name' do
      @transaction.name = nil
      expect(@transaction).to_not be_valid
    end

    it 'is invalid without an amount' do
      @transaction.amount = nil
      expect(@transaction).to_not be_valid
    end
  end
end
