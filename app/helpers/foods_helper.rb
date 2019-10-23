module FoodsHelper

  def current_user
    current_user = User.find(session[:user_id]) unless !User.exists?(id: session[:user_id])
  end

  def current_user_is_cook
    if current_user
      current_user[:is_cook]
    end
  end

end
