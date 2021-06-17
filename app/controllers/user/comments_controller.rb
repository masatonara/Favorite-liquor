class User::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @liquor = Liquor.find(params[:liquor_id])
    @comment = Comment.new(comment_params)
    @comment.liquor_id = @liquor.id
    @comment.user_id = current_user.id
    unless @comment.save
      render 'error'
    end
  end
  

  def destroy
    @liquor = Liquor.find(params[:liquor_id])
    comment = @liquor.comments.find(params[:id])
    comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
