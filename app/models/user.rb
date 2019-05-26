class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :password, confirmation: true, length: { minimum: 6 }, allow_nil: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, uniqueness: true, presence: true

  has_many :assessments
  has_many :surveys, through: :assessments

  def is_admin?
    role == 'admin'
  end
end
