class Admin::ToursController < Admin::ApplicationController
  before_filter :find_tour, :only => [:edit, :update, :destroy, :delete]

  def index
    @tours = Tour.order("#{sort_column} #{sort_direction}").page(params[:page]).per(10)
    @no = paging(10)
  end

  def new
    @tour = Tour.new
    @countries = Country.country_list
  end

  def create
    @tour = Tour.new(tour_params)
    unless params[:id].blank?
      find_tour
      @tour.parent_id = @tour.id
    end

    if @tour.save
      flash[:notice] = 'Tour was successfully create.'
      redirect_to admin_tours_path
    else
      @countries = Country.country_list
      flash[:error] = "Tour failed to create"
      render :action => :new
    end
  end

  def edit
    @countries = Country.country_list
  end

  def update
    if @tour.update_attributes(tour_params)
      flash[:notice] = 'Tour was successfully updated.'
      redirect_to admin_tours_path
    else
      @countries = Country.country_list
      flash[:error] = "Tour failed to update"
      render :action => :edit
    end
  end

  def destroy
    flash[:notice] = @tour.destroy ? 'Tour was successfully deleted.' :
                                           'Tour was falied to delete.'
    redirect_to admin_tours_path
  end

  private

    def tour_params
      params.require(:tour).permit(:name, :short_description, :description, :expired_date, :duration,
                                   :country_id, :itinerary_id, :tour_detail_id)
    end

    def find_tour
      @tour = Tour.find_by_permalink(params[:id])
      if @tour.nil?
        flash[:notice] = "Cannot find the Tour"
        redirect_to admin_tours_path
      end
    end

    def sort_column
      params[:sort] || "created_at"
    end

    def sort_direction
      params[:direction] || "desc"
    end
end
