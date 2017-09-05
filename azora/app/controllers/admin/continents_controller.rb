class Admin::ContinentsController < Admin::ApplicationController
  before_filter :find_continent, :only => [:edit, :update, :destroy, :delete]

  def index
    @continents = Continent.order("#{sort_column} #{sort_direction}").page(params[:page]).per(10)
    @no = paging(10)
  end

  def new
    @continent = Continent.new
  end

  def create
    @continent = Continent.new(continent_params)
    unless params[:id].blank?
      find_continent
      @continent.parent_id = @continent.id
    end

    if @continent.save
      flash[:notice] = 'Continent was successfully create.'
      redirect_to admin_continents_path
    else
      flash[:error] = "Continent failed to create"
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @continent.update_attributes(continent_params)
      flash[:notice] = 'Continent was successfully updated.'
      redirect_to admin_continents_path
    else
      flash[:error] = "Continent failed to update"
      render :action => :edit
    end
  end

  def destroy
    flash[:notice] = @continent.destroy ? 'Continent was successfully deleted.' :
                                           'Continent was falied to delete.'
    redirect_to admin_continents_path
  end

  private

    def continent_params
      params.require(:continent).permit(:name, :sequence, :banner)
    end

    def find_continent
      @continent = Continent.find_by_permalink(params[:id])
      if @continent.nil?
        flash[:notice] = "Cannot find the Continent"
        redirect_to admin_continents_path
      end
    end

    def sort_column
      params[:sort] || "created_at"
    end

    def sort_direction
      params[:direction] || "desc"
    end
end
