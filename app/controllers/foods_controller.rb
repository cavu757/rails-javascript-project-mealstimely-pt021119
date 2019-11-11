class FoodsController < ApplicationController
  before_action :food_new

  def new
    not_cook
    @food = Food.new
  end

  def create
    @food = Food.find_or_create_by(name: food_params[:name]) do |f|
      f.name = food_params[:name]
      f.picture = food_params[:picture]
      f.description = food_params[:description]
      f.cook_id = food_params[:cook_id]
    end
    redirect_to food_path(@food)
  end

  def index
    if current_user_is_cook
      @foods = Food.where(cook_id: session[:user_id])
    else
      @foods = Food.all
    end
    @meal = Meal.new
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @foods }
    end
  end

  def show

    if Food.where(id: params[:id]).exists?
      @food = Food.find(params[:id])
      if current_user_is_cook && session[:user_id] != @food[:cook_id]
        redirect_to foods_path and return
      end
      @meal = Meal.new
      respond_to do |format|
        format.html { render :show }
        format.json { render json: @food }
      end
    else
      redirect_to foods_path, alert: "Food does not exist"
    end
  end

  def edit
    not_cook
    @food = Food.find(params[:id])
  end

  def update
    not_cook
    @food = Food.find(params[:id])
    if @food.update(food_params)
      redirect_to food_path(@food)
    else
      render :edit
    end
  end

  def destroy
    not_cook
  end

  def next_food
    @food = Food.find(params[:id])
    @next_food = Food.find(@food.id + 1)
    render json: @next_food, include: ['name', 'picture', 'cook']
  end

  private

  def food_new
    @food = Food.new
  end

  def food_params
    params.require(:food).permit(:name, :picture, :description, :cook_id)
  end

  def not_cook
    if current_user_not_cook
      redirect_to "/foods"
    end
  end

  def current_user_is_cook
    if current_user
      current_user[:is_cook]
    end
  end

end
