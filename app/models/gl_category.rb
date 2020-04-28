class GlCategory < ApplicationRecord
  validates :name, uniqueness: true

  enum main_account_category: { asset: 1, liability: 2, capital: 3, income: 4, expense: 5 }
  has_paper_trail
end
