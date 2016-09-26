class User < ActiveRecord::Base
  has_many :lists
  has_many :tasks, through: :lists

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_secure_password

  def uncompleted_tasks
    self.tasks.select { |task| task.status == false }
  end

  def completed_tasks
    self.tasks.select { |task| task.status == true }
  end
end
