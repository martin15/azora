class Admin::CountriesController < Admin::ApplicationController
  before_filter :find_country, :only => [:show, :edit, :update, :destroy, :delete]
  before_filter :get_continent_list, :only => [:new, :create, :edit, :update]

  def index
    @countries = Country.order("#{sort_column} #{sort_direction}").page(params[:page]).per(20)
    @no = paging(20)
  end

  def show
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)
    if @country.save
      flash[:notice] = 'Country was successfully create.'
      redirect_to admin_countries_path
    else

      flash[:error] = "Country failed to create"
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @country.update_attributes(country_params)
      flash[:notice] = 'Country was successfully updated.'
      redirect_to admin_countries_path(:page => params[:page])
    else
      flash[:error] = "Country failed to update"
      render :action => :edit
    end
  end

  def destroy
    flash[:notice] =  @country.destroy ? 'Country was successfully deleted.' :
                                           'Country was falied to delete.'
    redirect_to admin_countries_path(:page => params[:page])
  end

  private

    def country_params
      params.require(:country).permit(:name, :banner, :free_visa, :free_visa_duration, :visa_on_arrival,
                                      :voa_duration, :visa_requirement, :continent_id)
    end

    def find_country
      @country = Country.find_by_permalink(params[:id])
      if @country.nil?
        flash[:notice] = "Cannot find the Country"
        redirect_to admin_countries_path
      end
    end

    def get_continent_list
      @continents = Continent.continent_list
    end

    def sort_column
      params[:sort] || "name"
    end

    def sort_direction
      params[:direction] || "asc"
    end
end
