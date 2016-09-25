class List < ActiveRecord::Base
  belongs_to :user
  has_many :tasks

  validates :name, presence: true
  validates :user_id, presence: true

  def author
    self.user.username
  end
end
