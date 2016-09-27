class Task < ActiveRecord::Base
  belongs_to :list
  has_one :user, through: :list

  validates :description,
            :list_id,
              presence: true
end
