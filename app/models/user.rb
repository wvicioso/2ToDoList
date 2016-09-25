class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :lists
  has_many :tasks, through: :lists

  validates :first_name, :last_name, :email, presence: true
  validates :username, uniqueness: true
  validates :email, uniqueness: { message: "has already been used." }, format: { with: /.+\@+.+[.]/, message: "must be a valid email address"}
  
  has_secure_password

end
