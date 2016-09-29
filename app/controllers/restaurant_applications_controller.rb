class RestaurantApplicationsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @restaurant_applications = RestaurantApplication.where(user: current_user)
  end

  def new
    @restaurant_application = RestaurantApplication.new
  end

  def create
    @restaurant_application = current_user.restaurant_application.build(restaurant_application_params)

    if @restaurant_application.save
      redirect_to restaurant_applications_path, notice: 'Application was successfully created.'
    else
      render :new
    end
  end

  def edit
    @restaurant_application = RestaurantApplication.find_by(id: params[:id])
  end

  def update
    @restaurant_application = RestaurantApplication.find_by(id: params[:id])

    if @restaurant_application.update(restaurant_application_params)
      redirect_to restaurant_applications_path, notice: 'application was successfully updated.'
    end
  end

  def destroy
    @restaurant_application = RestaurantApplication.find_by(id: params[:id])

    if @restaurant_application.destroy
      redirect_to restaurant_applications_path, notice: 'Application was successfully destroyed.'
    end
  end

  private

  def restaurant_application_params
    params.require(:restaurant_application).permit(:restaurant_name, :restaurant_doc, :phone, :status)
  end



end
