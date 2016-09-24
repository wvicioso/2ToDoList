class List < ActiveRecord::Base
  validates :title, presence: true
  validates :user_id, presence: true

  has_many :tasks
  belongs_to :user 
end
