class Admin::HotelsController < Admin::ApplicationController
  before_filter :find_hotel, :only => [:edit, :update, :destroy, :delete]

  def index
    @hotels = Hotel.order("#{sort_column} #{sort_direction}").page(params[:page]).per(10)
    @no = paging(10)
  end

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.new(hotel_params)
    if @hotel.save
      flash[:notice] = 'Hotel was successfully create.'
      redirect_to admin_hotels_path
    else
      @countries = Country.country_list
      flash[:error] = "Hotel failed to create"
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @hotel.update_attributes(hotel_params)
      flash[:notice] = 'Hotel was successfully updated.'
      redirect_to admin_hotels_path
    else
      flash[:error] = "Hotel failed to update"
      render :action => :edit
    end
  end

  def destroy
    flash[:notice] = @hotel.destroy ? 'Hotel was successfully deleted.' :
                                      'Hotel was falied to delete.'
    redirect_to admin_hotels_path
  end

  private

    def hotel_params
      params.require(:hotel).permit(:name, :website, :logo)
    end

    def find_hotel
      @hotel = Hotel.find_by_permalink(params[:id])
      if @hotel.nil?
        flash[:notice] = "Cannot find the Hotel"
        redirect_to admin_hotels_path
      end
    end

    def sort_column
      params[:sort] || "created_at"
    end

    def sort_direction
      params[:direction] || "desc"
    end
end
