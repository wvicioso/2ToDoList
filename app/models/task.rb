class Task < ActiveRecord::Base
  belongs_to :list
  belongs_to :user, through: :list

  validates :description,
            :list_id,
              presence: true
end
