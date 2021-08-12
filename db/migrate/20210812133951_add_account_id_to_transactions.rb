class AddAccountIdToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :account_id, :int
  end
end
