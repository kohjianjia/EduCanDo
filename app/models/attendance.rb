class Attendance < ApplicationRecord
	belonga_to :user
	belonga_to :event
end