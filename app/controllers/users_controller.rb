class UsersController < Clearance::UsersController

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to sign_in_path
		else
			render template: "users/new"
		end
	end

	private
	def user_params
  	  # params will require a user key, and user key will require the 5 keys
      params.require(:user).permit(:email, :password, :first_name, :last_name)
    end

end
