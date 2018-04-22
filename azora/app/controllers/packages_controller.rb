class PackagesController < ApplicationController
  def show
    @services = Service.all
    @types = ["domestic", "international"]
    @package = Package.find_by_permalink(params[:permalink])
    if @package.nil?
      flash[:error] = "Cannot Find Package with name '#{params[:permalink].humanize}'"
      if Package.default.blank?
        redirect_to services_path("incentive-tour")
      else
        redirect_to visa_detail_path(Package.default.permalink)
      end
      return
    end
    @type = @package.package_type
  end
end
