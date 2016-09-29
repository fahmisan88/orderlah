class RestaurantApplicationsController < ApplicationController

  def index
    @restaurant_applications = RestaurantApplication.all
  end

  def new
    @restaurant_application = RestaurantApplication.new
  end






end
