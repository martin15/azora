class Admin::CountryGalleriesController < Admin::ApplicationController
  before_filter :find_country#, :only => [:index, :create, :edit, :update, :destroy, :delete]
  before_filter :find_gallery, :only => [:edit, :update, :destroy, :delete]

  def index
    @galleries = @country.galleries.page(params[:page]).per(10)
    @no = paging(10)
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)
    if @gallery.save
      flash[:notice] = 'Gallery was successfully create.'
      redirect_to admin_country_galleries_path(@country.permalink)
    else
      flash[:error] = "Gallery failed to create"
      render :action => :new
    end
  end

  def edit
  end

  def update
    puts params.inspect
    if @gallery.update_attributes(gallery_params)
      flash[:notice] = 'Gallery was successfully updated.'
      redirect_to admin_country_galleries_path(@country.permalink)
    else
      @countries = Country.country_list
      flash[:error] = "Gallery failed to update"
      render :action => :edit
    end
  end

  def destroy
    flash[:notice] =  @gallery.destroy ? 'Gallery was successfully deleted.' :
                                         'Gallery was falied to delete.'
    redirect_to admin_country_galleries_path(@country.permalink)
  end

  private

    def gallery_params
      params.require(:gallery).permit(:image, :title, :description, :country_id, :continent_id)
    end

    def find_country
      @country = Country.includes([:galleries, :continent]).find_by_permalink(params[:id])
      if @country.nil?
        flash[:notice] = "Cannot find the Country"
        redirect_to admin_countries_path
      end
    end

    def find_gallery
      @gallery = @country.galleries.find_by_id(params[:gallery_id])
      if @gallery.nil?
        flash[:notice] = "Cannot find the Gallery"
        redirect_to admin_country_galleries_path(@country.permalink)
      end
    end
end
