class Category < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  has_many :transactions, foreign_key: 'category_id', class_name: 'Transaction'

  has_one_attached :icon

  validates :name, presence: true
  validates :icon, presence: true

  def total_amount
    transactions.sum(:amount)
  end
end
