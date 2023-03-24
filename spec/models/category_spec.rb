require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @user = User.create!(name: 'Tom', email: 'Tom@gmail.com', password: 'password1',
                         password_confirmation: 'password1')
    @category = Category.new(name: 'Category 1', user_id: @user.id)
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      @category.save
      expect(@category).to_not be_valid
    end

    it 'is invalid without a name' do
      @category.name = nil
      expect(@category).to_not be_valid
    end

    it 'is invalid without an icon' do
      @category.icon = nil
      expect(@category).to_not be_valid
    end
  end

  describe 'associations' do
    it 'has many transactions' do
      assc = described_class.reflect_on_association(:transactions)
      expect(assc.macro).to eq :has_many
    end

    it 'belongs to user' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
