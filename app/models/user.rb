class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  has_many :lists
  has_many :tasks, through: :lists

  has_secure_password

  validates :username, :email, presence: true, uniqueness: true
  validates :email, format: { with: VALID_EMAIL_REGEX}
end
