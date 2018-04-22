class Admin::PackagesController < Admin::ApplicationController
  before_filter :find_package, :only => [:edit, :update, :destroy, :delete]

  def index
    @packages = Package.order("#{sort_column} #{sort_direction}").page(params[:page]).per(10)
    @no = paging(10)
  end

  def new
    @package = Package.new
    @package.package_type = "domestic"
  end

  def create
    @package = Package.new(package_params)
    if @package.save
      flash[:notice] = 'Package was successfully create.'
      redirect_to admin_packages_path
    else
      @countries = Country.country_list
      flash[:error] = "Package failed to create"
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @package.update_attributes(package_params)
      flash[:notice] = 'Package was successfully updated.'
      redirect_to admin_packages_path
    else
      flash[:error] = "Package failed to update"
      render :action => :edit
    end
  end

  def destroy
    flash[:notice] = @package.destroy ? 'Package was successfully deleted.' :
                                      'Package was falied to delete.'
    redirect_to admin_packages_path
  end

  private

    def package_params
      params.require(:package).permit(:title, :city, :package_type, :banner, :description, :permalink)
    end

    def find_package
      @package = Package.find_by_id(params[:id])
      if @package.nil?
        flash[:notice] = "Cannot find the Package"
        redirect_to admin_packages_path
      end
    end

    def sort_column
      params[:sort] || "created_at"
    end

    def sort_direction
      params[:direction] || "desc"
    end
end
