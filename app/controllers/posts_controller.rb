class PostsController < ApplicationController
  before_action :set_post, only: [:update, :destroy]
	before_action :authenticate_user!, only: [:create]
	# protect_from_forgery with: :null_session


	def index
		@posts = Post.all
		render json: { posts: @posts }
	end

	def create
		@post = current_user.posts.new(post_params)
		if @post.save
			render json: { post: @post, message: 'post created successfully.' }
		else
			render json: { message: 'unable to create post' }, status: :unprocessable_entity
		end
	end

	def update
		if @post.update(post_params)
			render json: { post: @post, message: 'post updated successfully.' }
		else
			render :edit, status: :unprocessable_entity
		end
	end

	def destroy
		@post.destroy
		render json: { message: 'post deleted successfully.' }
	end

	def users_post
		current_user_posts = current_user.posts
		render json: { post: current_user_posts }, status: :ok
	end
	
	# def users_post
	# 	# current_user_posts = current_user.posts
	# 	user = User.find(id: params[:id])
	# 	user_post = user.posts
	# 	render json: { post: user_post }, status: :ok
	# end

	private

	def set_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:name, :description, :status, :rejected_reason)
	end
end
