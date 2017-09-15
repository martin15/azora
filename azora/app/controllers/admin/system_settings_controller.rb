class Admin::SystemSettingsController < Admin::ApplicationController
  before_filter :find_system_setting, :only => [:edit, :update]

  def index
    @system_settings = SystemSetting.all.page(params[:page]).per(10)
    @no = paging(10)
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
