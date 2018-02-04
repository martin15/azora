class GalleriesController < ApplicationController
  before_filter :find_continent, :only => [:show]

  def index
    @continents = Continent.all.order("sequence").each_slice(3).to_a
  end

  def show
    #@continents = Continent.all.order("name").each_slice(6).to_a
    @continents = Continent.all.order("name")
    @galleries_paginate = @continent.galleries.order("updated_at DESC").page(params[:page]).per(20)
    @galleries = @galleries_paginate.each_slice(3).to_a
    respond_to do |format|
      format.html
      format.js
    end
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
