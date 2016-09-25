class User < ActiveRecord::Base
  # Remember to create a migration!
  validates_presence_of :username, :email

  has_many :tasks

  has_secure_password

  def self.authenticate(username, password)
    user = User.find_by(username: username)
    return true if user && user.authenticate(password)
    false
  end
end
