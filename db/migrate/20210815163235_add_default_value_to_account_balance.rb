class AddDefaultValueToAccountBalance < ActiveRecord::Migration[6.0]
  def change
    change_column :accounts, :balance, :decimal, default: 0
  end
end
