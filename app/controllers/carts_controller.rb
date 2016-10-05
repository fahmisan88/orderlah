class CartsController < ApplicationController
  before_action :load_cart
  after_action :write_cart, only: [:add_meal, :remove_meal, :update_meal]

  def show
    @restaurants = current_order
  end

  def add_meal
    if @cart[params[:id]]
      quantity = params[:quantity].to_i
      quantityOld = @cart[params[:id]].to_i
      @cart[params[:id]] = quantityOld + quantity
    else
      @cart[params[:id]] = params[:quantity]
    end
  end

  def update_meal
    if @cart[params[:id]]
      @cart[params[:id]] = params[:quantity]
    end

  end

  def remove_meal
    @cart.delete params[:id]
  end

end
