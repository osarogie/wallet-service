class Branch < ApplicationRecord
  has_many :customer_accounts
  has_many :users
  has_paper_trail
end
