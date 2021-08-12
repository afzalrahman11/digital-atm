class Account < ApplicationRecord
  belongs_to :user
  validates :account_no, uniqueness: true, presence: true

end
