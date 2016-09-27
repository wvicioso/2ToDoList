class Task < ActiveRecord::Base
  belongs_to :todo_list
  has_one :user, through: :todo_list
  validates :description, presence: true

  def complete?
    self.status
  end



end
