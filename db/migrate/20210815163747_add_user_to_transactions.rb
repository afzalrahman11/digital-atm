class AddUserToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_reference :transactions, :user, index: true
  end
end
