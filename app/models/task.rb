class Task < ActiveRecord::Base
  belongs_to :list

  validates :description, :list_id, presence: true 
end
