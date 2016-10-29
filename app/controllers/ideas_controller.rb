class IdeasController < ApplicationController
  	before_action :current_user, only: [:create, :destroy]
	before_action :require_login, only: [:index, :create, :destroy]

	def index
		@ideas = Idea.find(params[:id])
		@users = Like.joins(:user).select("users.id as liker", "alias", "name").where("idea_id = #{params[:id]}")
	end

	def create
		user = User.find(params[:id])
		post = user.ideas.new(content: params[:content])
		if post.save
			redirect_to :back
		else
			flash[:errors] = ideas.errors.full_messages
  	 		redirect_to :back
  	 	end
	end

	def destroy
		idea = Idea.find(params[:id])
		idea.destroy if idea.user == current_user
		redirect_to :back
	end
end
