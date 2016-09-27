class User < ActiveRecord::Base

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true

  has_many :lists, dependent: :destroy
  has_many :tasks, through: :lists

  has_secure_password
end
