class Task < ActiveRecord::Base
  belongs_to :todo_list

  validates :description, presence: true

  def complete?
    self.status
  end
end
