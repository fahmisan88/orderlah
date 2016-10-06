class OrdersController < ApplicationController
  before_filter :authenticate_user!
  before_action :get_amount

  def edit
    @order = Order.find_by(id: params[:id])
    @restaurant = @order.restaurant
  end

  def update
    @order = Order.find_by(id: params[:id])
    @restaurant = @order.restaurant

    if @order.update(order_params)
    redirect_to restaurant_orders_path(restaurant_id: @restaurant.id), notice: 'Order status was successfully updated.'

  end
  end

  def index
    @orders = current_user.orders
  end

  def restaurant_orders
    @restaurant = Restaurant.find_by(id: params[:restaurant_id])
    @orders = @restaurant.orders
  end

  def new
    @restaurants = current_order
    # @order = Order.new
  end

  def create
    @restaurants = current_order

    @restaurants.each do |restaurant_id, restaurant|
      @order = current_user.orders.build( {:status => :received,
        :total => restaurant[:total],
        :restaurant_id => restaurant_id})

      restaurant[:meals].each do |meal|
        @order.ordered_meals.build( {:meal_id => meal.id, :quantity => meal.quantity })
      end

      if !@order.save
        break
      end
    end

    cookies.delete(:cart)
    redirect_to orders_path
  end

  private

  def get_amount
    if cookies[:cart]
      @cart = JSON.parse(cookies[:cart])
    else
      @cart = {}
    end

    @meals = []
    @total_price = 0.0;

    @cart.each do |meal_id,quantity|
      meal = Meal.find_by(id: meal_id)
      meal.define_singleton_method(:quantity) { quantity }
      price = meal.price * quantity.to_f
      @total_price += price
      @meals << meal
    end
  end

  def order_params
    params.require(:order).permit(:status)
  end


end
