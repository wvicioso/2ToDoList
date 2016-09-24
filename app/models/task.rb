class Task < ActiveRecord::Base
  validates :list_id, presence: true
  validates :task_description, presence: true
  validates_inclusion_of :marked_as_complete, in: [true, false]

  belongs_to :list
end
