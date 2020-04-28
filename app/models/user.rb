class User < ApplicationRecord
  enum level: { customer: 0, admin: 1, super_admin: 2 }

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,
  :confirmable, :lockable, :timeoutable,
  :trackable, :omniauthable

  validates :phone_number, phone: { allow_blank: true }

  has_paper_trail

  def display_name
   self.full_nname || self.email
  end
end
