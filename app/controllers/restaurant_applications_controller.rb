class RestaurantApplicationsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @restaurant_applications = RestaurantApplication.where(user: current_user)
  end

  def new
    @restaurant_application = RestaurantApplication.new
    # @restaurant_applications = RestaurantApplication.where(user: current_user)
  end

  def create
    @restaurant_application = current_user.restaurant_applications.build(restaurant_application_params)

    if @restaurant_application.save
      phone_number = @restaurant_application.build_phone_number(phone_number_params)

      if phone_number.save
        redirect_to restaurant_applications_path, notice: 'Application was successfully created.'
      else
        render :new
      end
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
    params.require(:restaurant_application).permit(:restaurant_name, :restaurant_doc)
  end

  def phone_number_params
    params.require(:restaurant_application).permit(:phone_number)
  end



end
