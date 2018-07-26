class AttendanceController < ApplicationController
	def index
		@attendance = Attendance.all
	end	

	def new	
	end

	def create
		@attendance = Attendance.new
		@attendance.user_id = current_user.id
		if current_user.role == "staff"
			flash[:danger] = "Come on!! You are a staff! why do you need attendance"
			redirect_back fallback_location: @attendance
		else
			@attendance.save
			redirect_to @attendance
		end

	end
end
