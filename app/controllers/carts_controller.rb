class CartsController < ApplicationController
  before_action :load_cart
  after_action :write_cart, only: [:add_meal, :remove_meal, :update_meal]

  def show
    @restaurants = current_order
  end

  def splitcart
    @restaurants = current_order
  end

  def add_meal
    @meal = Meal.find_by(id: params[:id])
    @restaurant = @meal.restaurant

    if @cart[params[:id]]
      quantity = params[:quantity].to_i
      quantityOld = @cart[params[:id]].to_i
      @cart[params[:id]] = quantityOld + quantity
      redirect_to restaurant_path(@restaurant), notice: 'Meal was successfully added. Would you like to add more or view your meals at your Cart'

    else
      @cart[params[:id]] = params[:quantity]
    end
  end

  def update_meal
    if @cart[params[:id]]
      # @cart[params[:id]] = params[:quantity]
      quantity = params[:quantity].to_i
      quantityOld = @cart[params[:id]].to_i
      @cart[params[:id]] = quantityOld + quantity
      if @cart[params[:id]] == 0
        remove_meal
      else
        redirect_to cart_path, notice: 'Meal was successfully updated.'
      end
    end


  end

  def remove_meal
    @cart.delete params[:id]
    redirect_to cart_path, notice: 'Meal was successfully deleted.'
  end


end
