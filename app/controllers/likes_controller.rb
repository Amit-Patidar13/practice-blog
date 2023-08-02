class LikesController < ApplicationController
	before_action :authenticate_user!
  before_action :set_post, only: [:create, :destroy]

  def create
    @like = @post.likes.build(user: current_user)

    if @like.save
      render json: { message: 'Post liked successfully.' }
    else
      render json: { message: 'Unable to like the post.' }, status: :unprocessable_entity
    end
  end

  def destroy
    @like = @post.likes.find_by(user: current_user)

    if @like&.destroy
      render json: { message: 'Post unliked successfully.' }
    else
      render json: { message: 'Unable to unlike the post.' }, status: :unprocessable_entity
    end
  end

  private 

  def set_post
    @post = Post.find(params[:post_id])
  end

end
