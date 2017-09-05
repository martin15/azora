class GalleriesController < ApplicationController
  before_filter :find_continent

  def index
    @continents = Continent.all.order("name")
    @galleries = @continent.galleries
  end

  private
    def find_continent
      @continent = Continent.find_by_permalink(params[:permalink])
      if @continent.nil?
        flash[:notice] = "Cannot find the Continent"
        redirect_to root_path
      end
    end
end
