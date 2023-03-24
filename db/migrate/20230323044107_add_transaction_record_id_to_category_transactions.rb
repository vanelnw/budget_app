class AddTransactionRecordIdToCategoryTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :category_transactions, :transaction_record_id, :integer
    add_index :category_transactions, :transaction_record_id
  end
end
