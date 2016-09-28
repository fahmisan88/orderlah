class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

def imagetest
  @imagetest = Meal.find_by(image: params[:image])
end

helper_method :imagetest

  rescue_from Pundit::NotAuthorizedError do |exception|
      flash[:danger] = "You're not authorized"
      redirect_to request.referrer || root_path
    end




end
