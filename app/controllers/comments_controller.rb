class CommentsController < ApplicationController

  def new
    @comment = Comment.new(user_id: params[:user_id])
  end

  def create
    @comment = Comment.create(comment_params)
    redirect_to meal_path(comment_params[:meal_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:meal_id, :user_id, :content)
  end
end
