class RestaurantsController < ApplicationController
  before_filter :authenticate_user!, only: [:dashboard, :new, :create, :edit, :update, :destroy]

  def dashboard
    @restaurants = current_user.restaurants
    authorize @restaurants
  end

  def index
    @restaurants = Restaurant.all

    if params[:search]
      Restaurant.reindex
      if params[:search].empty?
        redirect_to restaurants_path
      elsif
      @restaurants = Restaurant.search(params[:search], field:[{city: :word_start}])
    else
      @restaurants = Restaurant.all.order(created_at: :desc)
    end
  end
  end

  def show
    # @restaurants = Restaurant.all
    @restaurant = Restaurant.find_by(id: params[:id])
    @meals = Meal.where(restaurant_id: params[:id]) #--> you can use this code if there is no association between models
  end


  def new
    @restaurant = Restaurant.new
    authorize @restaurant
  end

  def create
    # @restaurant = Restaurant.new(restaurant_params)
    # @restaurant.user_id = current_user.id
    @restaurant = current_user.restaurants.build(restaurant_params)
    authorize @restaurant

    if @restaurant.save
      redirect_to dashboard_path, notice: 'Restaurant was successfully created.'
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
      redirect_to dashboard_path, notice: 'Restaurant was successfully updated.'
    end
  end

  def destroy
    @restaurant = Restaurant.find_by(id: params[:id])
    authorize @restaurant

    if @restaurant.destroy
      redirect_to dashboard_path, notice: 'Restaurant was successfully destroyed.'
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit( :name, :description, :address, :city, :postcode, :state, :country, :profile_image, :banner_image)
  end
end
