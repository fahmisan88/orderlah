class MealsController < ApplicationController
  def index
    @meals = Meal.all
  end

  def show
    @meal = Meal.find_by(id: params[:id])
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    if @meal.save
      redirect_to root_path
    else
      redirect_to root_path
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
