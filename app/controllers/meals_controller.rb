class MealsController < ApplicationController
  def index
    @meals = Meal.all
  end

  def show
    @meal = Meal.find_by(id: params[:id])
  end

  def new
    @restaurant = Restaurant.find_by(id: params[:restaurant_id])
    @meal = Meal.new
  end

  def create
    @restaurant = Restaurant.find_by(id: params[:restaurant_id])
    @meal = Meal.new(meal_params.merge(restaurant_id: params[:restaurant_id]))

      if @meal.save
        redirect_to restaurant_path(@restaurant), notice: 'Meals was successfully created.'
      else
        render :new
      end

  end

  def edit
    # @restaurant = Restaurant.find_by(id: params[:restaurant_id])
    @meal = Meal.find_by(id: params[:id])
    @restaurant = @meal.restaurant

  end

  def update
    @meal = Meal.find_by(id: params[:id])
    @restaurant = @meal.restaurant

    if @meal.update(meal_params)
      redirect_to restaurant_path(@restaurant), notice: 'Meal was successfully updated.'
    end
  end

  def destroy
    @meal = Meal.find_by(id: params[:id])
    @restaurant = @meal.restaurant

    if @meal.destroy
     redirect_to restaurant_path(@restaurant), notice: 'Meal was successfully destroyed.'
    end

  end

  private

  def meal_params
    params.require(:meal).permit( :name, :description, :price)
  end

end
