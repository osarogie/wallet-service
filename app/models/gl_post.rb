class GlPost < ApplicationRecord
  belongs_to :gl_account_to_credit, class_name: 'GlAccount'
  belongs_to :gl_account_to_debit, class_name: 'GlAccount'
  belongs_to :user
end
