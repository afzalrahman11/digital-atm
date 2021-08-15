class RemoveUserFromAccounts < ActiveRecord::Migration[6.0]
  def change
    remove_column :accounts, :user_id
  end
end
