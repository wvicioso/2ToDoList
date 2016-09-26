class List < ActiveRecord::Base
  belongs_to :user

  has_many :tasks

  validates :title, presence: true

  def self.sort_by(lists)
    lists.sort { |a, b| b.created_at <=> a.created_at }
  end
end
