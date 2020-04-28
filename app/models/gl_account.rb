class GlAccount < ApplicationRecord
  belongs_to :gl_category
  belongs_to :branch
  monetize :balance_cents
  validates :name, :code, presence: true
  has_paper_trail
end
