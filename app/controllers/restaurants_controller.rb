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

      if @restaurant.save
        redirect_to restaurants_path, notice: 'Restaurant was successfully created.'
      else
        render :new
      end


  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find_by(id: params[:id])

    if @restaurant.update(restaurant_params)
      redirect_to restaurants_path, notice: 'Restaurant was successfully updated.'
    end
  end

  def destroy
    @restaurant = Restaurant.find_by(id: params[:id])

    if @restaurant.destroy
     redirect_to restaurants_path, notice: 'Restaurant was successfully destroyed.'
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit( :name, :description, :address, :city, :postcode, :state, :country, :image)
  end
end
