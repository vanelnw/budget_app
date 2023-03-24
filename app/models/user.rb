class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :categories, class_name: 'Category', dependent: :destroy, foreign_key: 'user_id'
  has_many :transactions, class_name: 'Transaction', dependent: :destroy, foreign_key: 'user_id'

  validates :name, :email, :password, presence: true
end
