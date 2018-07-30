class DashboardController < ApplicationController
	def index
		@event = Event.all
		@user = User.where(role: "student")
	end

	def redeem
	end
	
end
