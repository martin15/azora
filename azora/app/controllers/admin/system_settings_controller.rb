class Admin::SystemSettingsController < Admin::ApplicationController
  before_filter :find_system_setting, :only => [:show, :edit, :update, :destroy, :delete]

  def index
    @system_settings = SystemSetting.all.page(params[:page]).per(10)
    @no = paging(10)
  end

  def new
    @system_setting = SystemSetting.new
  end

  def create
    @system_setting = SystemSetting.new(system_setting_params)
    if @system_setting.save
      flash[:notice] = 'SystemSetting was successfully create.'
      redirect_to admin_system_settings_path
    else

      flash[:error] = "SystemSetting failed to create"
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @system_setting.update_attributes(system_setting_params)
      flash[:notice] = 'SystemSetting was successfully updated.'
      redirect_to admin_system_settings_path
    else
      flash[:error] = "SystemSetting failed to update"
      render :action => :edit
    end
  end

  def destroy
    flash[:notice] =  @system_setting.destroy ? 'SystemSetting was successfully deleted.' :
                                                'SystemSetting was falied to delete.'
    redirect_to admin_system_settings_path
  end

  private

    def system_setting_params
      params.require(:system_setting).permit(:name, :value, :parent_id)
    end

    def find_system_setting
      @system_setting = SystemSetting.find_by_permalink(params[:id])
      if @system_setting.nil?
        flash[:notice] = "Cannot find the SystemSetting"
        redirect_to admin_system_settings_path
      end
    end
end
