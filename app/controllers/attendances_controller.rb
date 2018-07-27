class AttendancesController < ApplicationController
	def index
		@attendance = Attendance.where(user_id:current_user.id)
	end	

	def new
		@event = Event.find(params[:event_id])
	end

	def create
		@event = Event.find(params[:event_id])
		@attendance = Attendance.new
		@attendance.user_id = current_user.id
		@attendance.event_id = params[:event_id]
		if current_user.role == "staff" && @event.category == "class"
			flash[:danger] = "Come on!! You are a staff! why do you need attendance"
			redirect_back fallback_location: @attendance
		else
			@attendance.save
			user = User.find(current_user.id)
			user.point = current_user.point + 10
			user.save
			flash[:success] = "You are going to this event!"
			redirect_to @event
		end

	end
end
