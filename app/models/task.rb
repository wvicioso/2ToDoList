class Task < ActiveRecord::Base
  validates :description, presence: true
  validates :user_id, presence: true
  validates :list_id, presence: true
  validates_inclusion_of :marked_as_complete, in: [true, false]

  belongs_to :list
  has_one :user, through: :list
end
