class DashboardController < ApplicationController
	def index
		@event = Event.all
	end
end
