class SessionsController < ApplicationController


  def index
  	
  end

  def login
	 	@user = User.find_by_email(params[:email])
	 	if @user && @user.authenticate(params[:password])
	 		session[:user_id] = @user.id
	 		redirect_to "/users/#{@user.id}"
	 	else
	 		flash[:error] = "Invalid Login"
	 		redirect_to :back
	 	end
	end

	def destroy
			reset_session
    	redirect_to "/users/home"
	end

end
