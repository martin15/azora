class ToursController < ApplicationController
  before_filter :find_tour, :only => [:show]

  def index
    @continents = Continent.all.each_slice(6).to_a
  end

  def show
    @images = @tour.tour_images
    @itineraries = @tour.tour_itineraries.order("day")
  end

  private

    def find_tour
      @tour = Tour.includes([:tour_images, :tour_itineraries]).find_by_permalink(params[:id])
      if @tour.nil?
        flash[:notice] = "Cannot find the Tour"
        redirect_to admin_tours_path
      end
    end
end
