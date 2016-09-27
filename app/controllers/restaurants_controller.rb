class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find_by(id: params[:id])
    # @meals = Meal.where(restaurant_id: params[:id]) --> you can use this code if there is no association between models
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to root_path
    else
      redirect_to root_path
    end

  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      flash[:success]
    else
      flash[:danger]
    end
  end

  def destroy
  end

  private

  def restaurant_params
    params.require(:restaurant).permit( :name, :description, :address, :city, :postcode, :state, :country, :image)

  end
end
