class RestaurantsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index

    if params[:search]
      Restaurant.reindex
      @restaurants = Restaurant.search(params[:search], field:[{city: :word_start}])
    else
    @restaurants = Restaurant.all.order(created_at: :desc)
    end
  end

  def show
    @restaurant = Restaurant.find_by(id: params[:id])
    @meals = Meal.where(restaurant_id: params[:id]) #--> you can use this code if there is no association between models
  end

  def new
    @restaurant = Restaurant.new
    authorize @restaurant
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user_id = current_user.id
    authorize @restaurant

      if @restaurant.save
        redirect_to restaurants_path, notice: 'Restaurant was successfully created.'
      else
        render :new
      end
  end

  def edit
    @restaurant = Restaurant.find_by(id: params[:id])
    authorize @restaurant
  end

  def update
    @restaurant = Restaurant.find_by(id: params[:id])
    authorize @restaurant

    if @restaurant.update(restaurant_params)
      redirect_to restaurants_path, notice: 'Restaurant was successfully updated.'
    end
  end

  def destroy
    @restaurant = Restaurant.find_by(id: params[:id])
    authorize @restaurant

    if @restaurant.destroy
     redirect_to restaurants_path, notice: 'Restaurant was successfully destroyed.'
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit( :name, :description, :address, :city, :postcode, :state, :country, :profile_image, :banner_image)
  end
end
