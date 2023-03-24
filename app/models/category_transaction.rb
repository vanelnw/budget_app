class CategoryTransaction < ApplicationRecord
  belongs_to :category
  belongs_to :transaction_record, class_name: 'Transaction'
end
