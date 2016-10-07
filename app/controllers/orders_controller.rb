class OrdersController < ApplicationController
  before_filter :authenticate_user!
  before_action :get_amount
  before_action :load_cart, only: [:new]
  before_action :load_split_cart, only: [:splitorder]

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

    @order_times = {}
    for i in 1..6
      time = (Time.now.advance(:hours => +i).beginning_of_hour)
      @order_times[time.strftime("%H:%M")] = time
    end
  end

  def splitorder
    @meals = []

    params["meals"].each do |meal_id|
      meal = Meal.find_by(id: meal_id)
      quantity = @cart[meal_id]
      meal.define_singleton_method(:quantity) do
        quantity
      end

      @meals << meal
    end
  end

  def create
    @restaurants = current_order
    # binding.pry
    @restaurants.each do |restaurant_id, restaurant|
      binding.pry
      @order = current_user.orders.build( {:status => :Received,
        :total => restaurant[:total],
        :restaurant_id => restaurant_id,
        :eta => DateTime.strptime(
          params["order_times_"+restaurant_id.to_s],
          "%Y-%m-%d %H:%M:%S %Z")
        })

        restaurant[:meals].each do |meal|
          @order.ordered_meals.build( {:meal_id => meal.id, :quantity => meal.quantity })
        end

        if !@order.save
          break
        else

          cookies.delete(:cart)
        end
      end

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
