class UsersController < ApplicationController
	before_action :current_user, only:[:edit, :update, :delete_user]
  before_action :require_login, except: [:new, :create]
  before_action :require_correct_user, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
  end

  def create
  	user = User.new(user_params)
  	if user.save
  		session[:user_id] = user.id
  		redirect_to "/users/#{user.id}"
  	else
  		flash[:errors] = user.errors.full_messages
  	 	redirect_to :back
	 end

  end

	def show
	    @user = User.find(current_user.id)
	 end



  private
  def user_params
    params.require(:user).permit(:name, :alias, :email, :password)
  end

end
