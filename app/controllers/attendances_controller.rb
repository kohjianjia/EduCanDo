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
			flash[:danger] = "Come on!! You are a staff! Why do you need attendance?"
			redirect_back fallback_location: @attendance
		else
			@attendance.save
			user = User.find(current_user.id)
			user.point = current_user.point + 10
			user.save
			flash[:success] = "You've sucessfully saved attendance, and you've earned 10 points!"
			redirect_to event_attendance_path(@event, @attendance)
		end

	end

	def create_egg
		@event = Event.find(params[:event_id])
		@attendance = Attendance.find_by(user_id:current_user.id, event_id:@event.id)
		if @attendance.egg == false
			user = User.find(current_user.id)
			@random = rand(0..20)
			user.point = current_user.point + @random

			user.save
			
			@attendance.update(egg: true)
			
		  	flash[:extra] = "You've earned extra #{@random} points!"
		  	redirect_to @event
		end
	end

	def show
		@event = Event.find(params[:event_id])
		@attendance = Attendance.find(params[:id])
	end
end
