class Tasklist < ApplicationRecord

		has_many :tasks
		validates(:tasklistname, presence: true)

end