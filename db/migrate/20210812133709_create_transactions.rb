class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.decimal :withdraw_amount
      t.decimal :deposit_amount
      t.timestamps
    end
  end
end
