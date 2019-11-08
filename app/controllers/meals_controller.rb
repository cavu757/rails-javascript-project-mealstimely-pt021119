class MealsController < ApplicationController

def index
  @meals = Meal.where(user_id: session[:user_id])
  respond_to do |format|
    format.html { render :index }
    format.json { render json: @meals }
  end
end

def create
  @meal = Meal.create(meal_params)
  @food = Food.find(@meal[:food_id])
  @eater = User.find(@meal[:user_id])
  @cook = User.find(@food.cook_id)
  redirect_to user_meals_path
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

def all_meals
  @all_meals = Meal.order(created_at: :desc)
  render json: @all_meals
end

private

def meal_params
  params.require(:meal).permit(:meal_name, :food_id, :user_id, :cook_id)
end

end
