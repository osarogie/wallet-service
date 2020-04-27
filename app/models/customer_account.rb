class CustomerAccount < ApplicationRecord
  enum account_type: { savings: 1, current: 2, loan: 3 }

  belongs_to :user
  belongs_to :branch

  has_paper_trail
end
