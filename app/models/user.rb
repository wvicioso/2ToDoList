class User < ActiveRecord::Base
  has_many :todo_lists
  has_many :tasks, through :todo_lists

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  has_secure_password
end
