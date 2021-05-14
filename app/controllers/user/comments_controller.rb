class User::CommentsController < ApplicationController
  before_action :authenticate_user!

	def create
		@liquor = Liquor.find(params[:liquor_id])
		@liquor_new = Liquor.new
		@comment = Comment.new(comment_params)
		@comment.liquor_id = @liquor.id
		@comment.user_id = current_user.id
		if @comment.save
  		redirect_to liquor_path(@liquor.id)
		else
		  render 'liquors/show'
		end
	end

	def destroy
		@liquor = Liquor.find(params[:liquor_id])
  	comment = @liquor.comments.find(params[:id])
		comment.destroy
		redirect_to request.referer
	end

	private
	def comment_params
		params.require(:comment).permit(:comment)
	end


end
