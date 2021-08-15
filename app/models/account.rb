class Account < ApplicationRecord
  has_many :user_accounts
  has_many :users, through: :user_accounts
  before_validation :set_default_account_type
  validates :balance, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :account_no, uniqueness: true, presence: true
  enum account_type:{
    savings: "Savings Account",
    current: "Current Account"
  }

  private

  def set_default_account_type
    self.account_type = "Savings Account" unless self.account_type
  end

end
