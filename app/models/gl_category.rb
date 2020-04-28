class GlCategory < ApplicationRecord
  enum main_account_category: { asset: 1, liability: 2, capital: 3, income: 4, expense: 5 }
  validates :name, uniqueness: true
  validates :main_account_category, presence: true
  has_paper_trail
end
