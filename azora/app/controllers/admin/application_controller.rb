class Admin::ApplicationController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout 'admin'
  before_filter :require_admin_login

  def require_admin_login
     if current_user.nil?
       flash[:alert] = "Only Admin are permitted to access this page"
       redirect_to login_path
       return
     else
       return current_user
    end
  end


end
