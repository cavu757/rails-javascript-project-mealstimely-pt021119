class UsersController < ApplicationController

  before_action :user_new


  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash.alert = nil
      redirect_to user_path(@user)
    else
      flash.alert =  "Could not create user.  Please correct highlighted fields."
      # @user.errors.full_messages.join(" / ")
      render 'new'
    end
  end

  def show
    @user = User.find(session[:user_id]) unless !User.exists?(id: session[:user_id])
    if session[:user_id].to_s != params[:id] || session[:user_id].nil?
      flash.alert = "User is not logged in. Click to Log In above."
      session[:user_id] = nil
      redirect_to root_path
    end
    @foods_cooked = Food.my_food(session[:user_id])
    @meals_cooked = Meal.my_meal(session[:user_id])
  end

  def mostmeals

    @eaters = User.eaters
    most = 0
    @mostmeals = []
    @eaters.each do |e|
      if e.meals.count > most
        @mostmeals = []
        most = e.meals.count
        @mostmeals << e
      elsif e.meals.count == most
        most = e.meals.count
        @mostmeals << e
      elsif e.meals.count < most
        @mostmeals
      end
    end
    @mostmeals


  end


  private

  def user_params
    params.require(:user).permit(:name, :is_cook, :email, :password, :password_confirmation)
  end

  def user_new
    @user = User.new
  end


end
