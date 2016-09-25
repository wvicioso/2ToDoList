class User < ActiveRecord::Base
  has_many  :lists, foreign_key: "creator_id"
  has_many  :tasks, through: :lists

  validates  :username, uniqueness: true
  validates  :email, uniqueness: true

  has_secure_password
end
