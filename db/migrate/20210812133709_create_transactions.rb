class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.string :tr_action
      t.timestamps
    end
  end
end
