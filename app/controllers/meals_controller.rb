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

    respond_to do |format|
      if @meal.save
        format.html { redirect_to restaurant_path(@restaurant), notice: 'Meals was successfully created.' }
      else
        format.html { render :new }
      end
    end

  end

  def edit
    @meal = Meal.find(params[:id])
  end

  def update
    @meal = Meal.find(params[:id])
    if @meal.update(meal_params)
      flash[:success]
    else
      flash[:danger]
    end
  end

  def destroy
  end

  private

  def meal_params
    params.require(:meal).permit( :name, :description, :price)
  end

end
