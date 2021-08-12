class AddAccountIdToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_reference :transactions, :account, index: true
  end
end
