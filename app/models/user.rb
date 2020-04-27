class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,
  :confirmable, :lockable, :timeoutable,
  :trackable, :omniauthable

  validates :phone_number, phone: true
end
