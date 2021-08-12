class Account < ApplicationRecord
  validates :account_no, uniqueness: true, presence: true

end
