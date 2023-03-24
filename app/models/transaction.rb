class Transaction < ApplicationRecord
  # associations
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_and_belongs_to_many :categories, dependent: :destroy

  # validations
  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
