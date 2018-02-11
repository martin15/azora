class HotelsController < ApplicationController
  def index
    @hotels = Hotel.order("name")
    @services = Service.all
  end
end
