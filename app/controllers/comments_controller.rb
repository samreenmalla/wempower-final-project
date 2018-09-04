class CommentsController < ApplicationController
	before_action :authenticate_user!, only: :create

	def create
		@post = Post.find(params[:post_id])
		#@idea = Idea.find(params[:idea_id])
		@comment = @post.comments.create(comment_params.merge(user_id: current_user.id))
		#@comment = @idea.comments.create(comment_params.merge(user_id: current_user.id))
		if @comment.valid?
			flash[:success] = "comment added"
			redirect_to root_path
		else
			flash[:alert] = "Inavlid attributes."
			redirect_to root_path
		end
  end

	private 
	def comment_params
		params.require(:comment).permit(:text, :post_id)
		params.require(:comment).permit(:text, :idea_id)
	end
end
