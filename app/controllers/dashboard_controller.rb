class DashboardController < ApplicationController
	def index
		@event = Event.all
		@user = User.where(role: "student")
		@attendees = Attendance.where(event_id: @event)
	end

	def redeem
		@user = User.find(current_user.id)
	end
	
	def redeem_points
		@user = User.find(current_user.id)
		if current_user.point >= params[:name].to_i 
		@user.point = current_user.point - params[:name].to_i
		@user.save
		flash[:success] = "You've sucessfully redeemed, #{params[:name]} points have deducted "
		redirect_back(fallback_location: root_path)
		else
			flash[:success] = "You don't have #{params[:name]} points yet "
			redirect_back(fallback_location: root_path)

		end
		
	end
end
