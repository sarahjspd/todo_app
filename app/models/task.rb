class Task < ApplicationRecord

	belongs_to :tasklist
	validates(:taskname, presence: true)

end