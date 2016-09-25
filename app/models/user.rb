class User < ActiveRecord::Base
  has_many :lists
  has_many :tasks, through: :lists 

  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true

  def marked_lists
    self.lists.select do |list|
      list.tasks.select { |task| task.marked_as_complete == true}.count >= 1
    end
  end
end
