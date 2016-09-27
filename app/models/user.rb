class User < ActiveRecord::Base
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true

  has_many :lists
  has_many :tasks, through: :lists

  has_secure_password

  def complete_tasks
  	self.tasks.where(complete: true)
  end

  def incomplete_tasks
  	self.tasks.where(complete: false)
  end
end
