class Admin::TourImagesController < Admin::ApplicationController
  before_filter :find_tour, :only => [:index, :create, :edit, :update, :destroy, :delete]
  before_filter :find_tour_image, :only => [:edit, :update, :destroy, :delete]

  def index
    @tour_images = @tour.tour_images
    @tour_image = TourImage.new
  end

  def create
    @tour_image = TourImage.new(tour_image_params)
    @tour_image.tour = @tour
    if @tour_image.save
      flash[:notice] = 'TourImage was successfully create.'
      redirect_to admin_tour_images_path
    else
      flash[:error] = "TourImage failed to create"
      render :action => :new
    end
  end

  def edit
    @tour_images = @tour.tour_images
  end

  def update
    puts params.inspect
    if @tour_image.update_attributes(tour_image_params)
      flash[:notice] = 'TourImage was successfully updated.'
      redirect_to admin_tour_images_path
    else
      flash[:error] = "TourImage failed to update"
      render :action => :edit
    end
  end

  def destroy
    flash[:notice] =  @tour_image.destroy ? 'TourImage was successfully deleted.' :
                                            'TourImage was falied to delete.'
    redirect_to admin_tour_images_path
  end

  private

    def tour_image_params
      params.require(:tour_image).permit(:image, :tour_id, :is_primary)
    end

    def find_tour
      @tour = Tour.find_by_permalink(params[:id])
      if @tour.nil?
        flash[:notice] = "Cannot find the Tour"
        redirect_to admin_tours_path
      end
    end

    def find_tour_image
      @tour_image = TourImage.find_by_id(params[:tour_image_id])
      if @tour_image.nil?
        flash[:notice] = "Cannot find the TourImage"
        redirect_to admin_tour_images_path
      end
    end
end
