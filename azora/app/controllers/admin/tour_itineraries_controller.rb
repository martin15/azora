class Admin::TourItinerariesController < Admin::ApplicationController
  before_filter :find_tour, :only => [:index, :create, :edit, :update, :destroy, :delete]
  before_filter :find_tour_itinerary, :only => [:edit, :update, :destroy, :delete]

  def index
    @tour_itineraries = @tour.tour_itineraries
    @tour_itinerary = TourItinerary.new
  end

  def create
    @tour_itinerary = TourItinerary.new(tour_itinerary_params)
    @tour_itinerary.tour = @tour
    if @tour_itinerary.save
      flash[:notice] = 'TourItinerary was successfully create.'
      redirect_to admin_tour_itineraries_path
    else
      flash[:error] = "TourItinerary failed to create"
      render :action => :new
    end
  end

  def edit
    @tour_itineraries = @tour.tour_itineraries
  end

  def update
    puts params.inspect
    if @tour_itinerary.update_attributes(tour_itinerary_params)
      flash[:notice] = 'TourItinerary was successfully updated.'
      redirect_to admin_tour_itineraries_path
    else
      flash[:error] = "TourItinerary failed to update"
      render :action => :edit
    end
  end

  def destroy
    flash[:notice] =  @tour_itinerary.destroy ? 'TourItinerary was successfully deleted.' :
                                            'TourItinerary was falied to delete.'
    redirect_to admin_tour_itineraries_path
  end

  private

    def tour_itinerary_params
      params.require(:tour_itinerary).permit(:day, :title, :description, :tour_id)
    end

    def find_tour
      @tour = Tour.find_by_permalink(params[:id])
      if @tour.nil?
        flash[:notice] = "Cannot find the Tour"
        redirect_to admin_tours_path
      end
    end

    def find_tour_itinerary
      @tour_itinerary = TourItinerary.find_by_id(params[:tour_itinerary_id])
      if @tour_itinerary.nil?
        flash[:notice] = "Cannot find the TourItinerary with id '#{params[:tour_itinerary_id]}'"
        redirect_to admin_tour_itineraries_path
      end
    end
end
