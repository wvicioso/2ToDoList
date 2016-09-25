class List < ActiveRecord::Base
  belongs_to  :creator, class_name: "User", foreign_key: "creator_id"
  has_many    :tasks

  validates :name, presence: true

  def created_by
    self.creator
  end
end
