class MealsController < ApplicationController

def index
  @meals = Meal.order(created_at: :desc)
end

def create
  @meal = Meal.create(meal_params)
  @food = Food.find(@meal[:food_id])
  @eater = User.find(@meal[:user_id])
  @cook = User.find(@food.cook_id)
  redirect_to meal_path(@meal)
end

def show
  if Meal.where(id: params[:id]).exists?
    @meal = Meal.find(params[:id])
    @food = Food.find(@meal[:food_id])
    @eater = User.find(session[:user_id])
    @cook = User.find(@food.cook_id)
    @comment = Comment.new
    @meal_comments = @meal.comments
  else
    flash.alert = "Meal does not exist."
    redirect_to root_path
  end
end



private

def meal_params
  params.require(:meal).permit(:food_id, :user_id, :cook_id)
end

end
