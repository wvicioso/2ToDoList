class Task < ActiveRecord::Base
	validates :name, presence: true
	validates :list_id, presence: true

	belongs_to :list

end
