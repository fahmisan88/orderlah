class LandingController < ApplicationController

  def show
    @restaurants = Restaurant.all.order("created_at desc").limit(6)
  end
end
