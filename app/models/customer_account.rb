class CustomerAccount < ApplicationRecord
  enum account_type: { savings: 1, current: 2, loan: 3 }
  belongs_to :user
  belongs_to :branch
  validates :account_name, :account_number, :account_type, presence: true
  has_paper_trail

  def display_name
    "#{account_number} #{account_name}"
  end
end
