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
    @restaurant.user_id = current_user.id


    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to restaurants_path, notice: 'Restaurant was successfully created.' }
      else
        format.html { render :new }
      end
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
