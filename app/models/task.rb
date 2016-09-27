class Task < ActiveRecord::Base
  belongs_to :list

  validates :description, :status, presence: true
end
