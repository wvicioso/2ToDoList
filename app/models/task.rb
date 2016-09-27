class Task < ActiveRecord::Base
  belongs_to :list

  validates :description, :list_id, presence: true 

  def task_overdue? 
    if self.due_date
      self.due_date < Time.now 
    end   
  end 
    
end
