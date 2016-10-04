class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError do |exception|
      flash[:danger] = "You're not authorized"
      redirect_to request.referrer || root_path
    end

  def require_restaurant_owner(user_id)  #user_id is just a placeholder, can be xyz
    if current_user && (current_user == User.find(user_id))

    else
      redirect_to restaurants_path
    end
  end


end
