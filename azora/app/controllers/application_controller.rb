class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :continent_list
  protect_from_forgery with: :exception
  BRAND_NAME = 'Azora Travel'.freeze

  def meta_title(title = "")
    [title, BRAND_NAME].reject(&:empty?).join(' | ')
  end

  def paging(per_page)
    start_number = params[:page].nil? ? 0*per_page : (params[:page].to_i-1)*per_page
    return start_number
  end

  def continent_list
    @continent_list = Continent.all.order("name")
  end

  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end
end
