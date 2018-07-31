class DashboardController < ApplicationController
	def index
		@event = Event.all
		@user = User.where(role: "student")
		@attendees = Attendance.where(event_id: @event)
	end

	def redeem
	end
	
end
