class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  has_many :lists
  has_many :tasks, through: :lists

  validates :username, :email, uniqueness: true, presence: true
  validates :email, format: { with: VALID_EMAIL_REGEX }

  has_secure_password
end
