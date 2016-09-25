class List < ActiveRecord::Base
  validates :title, presence: true
  validates :user_id, presence: true

  has_many :tasks
  belongs_to :user 

  def true_tasks
    self.tasks.select { |task| task.marked_as_complete == true } 
  end

end
