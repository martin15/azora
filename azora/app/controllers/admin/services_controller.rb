class Admin::ServicesController < Admin::ApplicationController
  before_filter :find_service, :only => [:edit, :update, :destroy, :delete]

  def index
    @services = Service.where("permalink in ('incentive-tour', 'mice')").
                        order("#{sort_column} #{sort_direction}").page(params[:page]).per(10)
    @no = paging(10)
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    unless params[:id].blank?
      find_service
      @service.parent_id = @service.id
    end

    if @service.save
      flash[:notice] = 'Service was successfully create.'
      redirect_to admin_services_path
    else
      flash[:error] = "Service failed to create"
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @service.update_attributes(service_params)
      flash[:notice] = 'Service was successfully updated.'
      redirect_to admin_services_path
    else
      flash[:error] = "Service failed to update"
      render :action => :edit
    end
  end

  def destroy
    flash[:notice] = @service.destroy ? 'Service was successfully deleted.' :
                                           'Service was falied to delete.'
    redirect_to admin_services_path
  end

  private

    def service_params
      params.require(:service).permit(:service_type, :name, :value)
    end

    def find_service
      @service = Service.find_by_permalink(params[:id])
      if @service.nil?
        flash[:notice] = "Cannot find the Service"
        redirect_to admin_services_path
      end
    end

    def sort_column
      params[:sort] || "created_at"
    end

    def sort_direction
      params[:direction] || "desc"
    end
end
