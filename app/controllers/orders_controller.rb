class OrdersController < ApplicationController
  before_action :get_amount
  def index
    @orders = Order.all
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


end