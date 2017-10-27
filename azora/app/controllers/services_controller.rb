class ServicesController < ApplicationController

  def show
    @service = Service.find_by_permalink(params[:permalink])
    if @service.nil?
      flash[:notice] = "Cannot find the Service"
      redirect_to root_path
    end
  end
end
