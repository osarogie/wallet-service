class GlAccount < ApplicationRecord
  belongs_to :gl_category
  belongs_to :branch
end
