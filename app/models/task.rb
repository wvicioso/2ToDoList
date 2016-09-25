class Task < ActiveRecord::Base
  # Remember to create a migration!
  validates_presence_of :content, :user_id

  belongs_to :user

  after_initialize :init

  def init
    self.status ||= "incomplete"
  end
end
