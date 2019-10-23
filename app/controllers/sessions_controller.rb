class SessionsController < ApplicationController
  def new
  end

  def create
    if !!auth
      @user = User.find_or_create_by(email: auth['info']['email']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.is_cook = false
        u.password_digest = SecureRandom.hex(64)
      end
      session[:user_id] = @user.id
      @auth = auth
      redirect_to user_url(@user)
    else
      @user = User.find_by(email: user_params[:email])
      if @user
        if @user.authenticate(user_params[:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          flash.alert = "Could not log you in"
          redirect_to signin_path
        end
      else
        flash.alert = "User not found"
        redirect_to signin_path
      end
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def auth
    request.env['omniauth.auth']
  end
end
