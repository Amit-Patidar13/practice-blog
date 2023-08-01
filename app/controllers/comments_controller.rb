class CommentsController < ApplicationController
	before_action :authenticate_user!
  def create
		debugger
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new(comment_params)
		@comment.user = current_user

		if @comment.save
			# redirect_to @post, notice: 'Comment added successfully.'
			render json: { comment: @comment, message: 'Comment added successfully.' }
		else
			render json: { message: 'unable to comment on the post' }, status: :unprocessable_entity
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@post = @comment.post

		if @comment.destroy
			render json: { post:  @post, notice: 'Comment deleted successfully.' }
		else
			render json: { post: @post, alert: 'Error deleting comment.' }
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:content)
	end
end
