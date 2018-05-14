class Admin::GalleriesController < Admin::ApplicationController
  before_filter :find_country, :only => [:create, :update]
  before_filter :find_gallery, :only => [:edit, :update, :destroy, :delete]

  def index
    @galleries = Gallery.order("updated_at DESC").page(params[:page]).per(20)
    @no = paging(20)
  end

  def new
    @gallery = Gallery.new
    @countries = Country.country_list
    @continents = Continent.continent_list
  end

  def create
    params[:gallery][:continent_id] = @country.continent_id
    @gallery = Gallery.new(gallery_params)
    if @gallery.save
      flash[:notice] = 'Gallery was successfully create.'
      redirect_to admin_galleries_path
    else
      @countries = Country.country_list
      @continents = Continent.continent_list
      flash[:error] = "Gallery failed to create"
      render :action => :new
    end
  end

  def edit
    @countries = Country.country_list
    @continents = Continent.continent_list
  end

  def update
    params[:gallery][:continent_id] = @country.continent_id
    if @gallery.update_attributes(gallery_params)
      flash[:notice] = 'Gallery was successfully updated.'
      redirect_to admin_galleries_path
    else
      @countries = Country.country_list
      @continents = Continent.continent_list
      flash[:error] = "Gallery failed to update"
      render :action => :edit
    end
  end

  def destroy
    flash[:notice] =  @gallery.destroy ? 'Gallery was successfully deleted.' :
                                         'Gallery was falied to delete.'
    redirect_to admin_galleries_path
  end

  private

    def gallery_params
      params.require(:gallery).permit(:image, :title, :description, :country_id, :continent_id)
    end

    def find_gallery
      @gallery = Gallery.find_by_id(params[:id])
      if @gallery.nil?
        flash[:notice] = "Cannot find the Gallery"
        redirect_to admin_galleries_path
      end
    end

    def find_country
      @country = Country.find_by_id(params[:gallery][:country_id])
      if @country.nil?
        flash[:notice] = "Cannot find the Country"
        params[:action] == "update" ? (render :action => :edit) : (render :action => :new)
      end
    end
end
