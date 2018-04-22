class PackagesController < ApplicationController

  def index
    @services = Service.all
    @types = ["domestic", "international"]
    @packages = Package.where("package_type = '#{params[:type].downcase}'").order("title DESC").
                        page(params[:page]).per(12)
    @packages_arr = @packages.each_slice(3).to_a
  end

  def show
    respond_to do |format|
      @package = Package.find_by_permalink(params[:permalink])

      format.js
    end
  end
end
