class Task < ActiveRecord::Base
  belongs_to :list

  validates :description, presence: true

  def completed?
    self.status == true
  end
end
