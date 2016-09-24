class Task < ActiveRecord::Base
  belongs_to :todo_list
  belongs_to :user, through :todo_list

  validates :description, presence: true
end
