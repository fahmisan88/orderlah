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

  private

  def current_order
    restaurants = {}
    @cart.each do |meal_id,quantity|
      meal = Meal.find_by(id: meal_id)
      meal.define_singleton_method(:quantity) do
        quantity
      end

      if(!restaurants[meal.restaurant.id])
        restaurants[meal.restaurant.id] = {
          :name => meal.restaurant.name,
          :total => 0,
          :meals => []
        }
      end

      restaurants[meal.restaurant.id][:total] += meal.price * meal.quantity.to_i
      restaurants[meal.restaurant.id][:meals] << meal
    end

    restaurants
  end

  def load_cart
    if cookies[:cart]
      @cart = JSON.parse(cookies[:cart])
    else
      @cart = {}
    end
  end

  def write_cart
    cookies[:cart] = JSON.generate(@cart)
  end

end
