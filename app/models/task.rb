class Task < ActiveRecord::Base
  belongs_to :list

  validates :title, :description, :list_id, presence: true
end
