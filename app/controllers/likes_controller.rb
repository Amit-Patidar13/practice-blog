class LikesController < ApplicationController
	before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(user: current_user)

    if @like.save
      render json: { message: 'Post liked successfully.' }
    else
      render json: { message: 'Unable to like the post.' }, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = @post.likes.find_by(user: current_user)

    if @like&.destroy
      render json: { message: 'Post unliked successfully.' }
    else
      render json: { message: 'Unable to unlike the post.' }, status: :unprocessable_entity
    end
  end
end
