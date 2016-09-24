class Task < ActiveRecord::Base
  belongs_to :todo_list

  validates :description, presence: true
end
