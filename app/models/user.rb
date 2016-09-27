class User < ActiveRecord::Base
  has_many :lists
  has_many :tasks, through: :lists

  validates :username, uniqueness: { scope: :email }
  validates :username,
            :email,
              presence: true
end
