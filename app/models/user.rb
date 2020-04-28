class User < ApplicationRecord
  enum level: { customer: 0, admin: 1, super_admin: 2 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable,
         :trackable, :omniauthable
  has_many :customer_accounts
  validates :phone_number, phone: { allow_blank: true }
  validates_associated :customer_accounts
  has_paper_trail

  def display_name
    full_name || email
  end
end
