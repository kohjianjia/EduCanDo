class EventsController < ApplicationController
	def index
		@event = Event.all
	end

	def create
		@event = Event.new(event_params)
		@event.user_id = current_user.id
		if current_user.role == "student" && @event.category == "class"
			flash[:danger] = "Students are not allowed to host classes"
			redirect_back fallback_location: @event
		else
			@event.save
			redirect_to @event
		end

	end
	
	def new
	end

	def show
		@event = Event.find(params[:id])
	end
	
	def edit
		@event = Event.find(params[:id])
	end
		
	def update
		@event = Event.find(params[:id])
		if @event.user_id != current_user.id
			flash[:danger] = "You're not the host of this event!"
			redirect_back fallback_location: @event
		else
			if @event.update(event_params)
				redirect_to @event
			else
				render 'edit'
			end

		end

	end

	def destroy
		@event = Event.find(params[:id])
		@event.destroy

		redirect_to events_path
	end	

	private
	def event_params
		params.require(:event).permit(:category, :description, :venue, :event_date, :start_time, :end_time, :title)

	end	

end
