class User < ActiveRecord::Base
  has_many :lists 
  has_many :tasks, through: :lists

  has_secure_password

  validates :username, :email, presence: true 
  validates :email, :username, uniqueness: { message: "has already been used." } 
  validates :email, format: { with: /.+\@+.+[.]/, message: "must be a valid email address"}
end
