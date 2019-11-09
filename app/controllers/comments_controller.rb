class CommentsController < ApplicationController

  def new
    @comment = Comment.new(user_id: params[:user_id])
  end

  def create
    @comment = Comment.create(comment_params)
    render json: @comment
  end

  def index
    if params[:meal_id]
      @meal_comments = Comment.where(meal_id: params[:meal_id])
      render json: @meal_comments
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:meal_id, :user_id, :content)
  end
end
