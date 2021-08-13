class Transaction < ApplicationRecord
  belongs_to :account
  validate :account_balance
  enum tr_action: {
    credit: "Credit", 
    debit: "Debit"
  }
  after_save :update_account_balance

  private

    def update_account_balance
      current_bal = account.balance
      account.update(balance: self.credit? ? current_bal + self.amount : current_bal-self.amount)
    end

    def account_balance
      if self.debit?
        current_bal = account.balance
        errors.add(:base, "Insufficient balance") if current_bal < self.amount
      end
    end

end