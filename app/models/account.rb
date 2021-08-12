class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions
  validates :account_no, uniqueness: true, presence: true


end
