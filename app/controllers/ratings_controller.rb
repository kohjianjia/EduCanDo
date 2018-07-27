class RatingsController < ApplicationController
		
	def new
		@event = Event.find(params[:event_id])
	end

	def create
		@event = Event.find(params[:event_id])
		@rating = Rating.new(rating_params)
		@rating.user_id = current_user.id
		@rating.event_id = params[:event_id]
		if @rating.save && @rating.star != nil
			user = User.find(current_user.id)
			user.point = current_user.point + 10
			user.save
			redirect_to @event
		elsif @rating.save
			redirect_to @event
		else 
			redirect_back(fallback_location: root_path)
		end
	end


	private
	def rating_params
		params.require(:rating).permit(:comment,:star)
	end

end
