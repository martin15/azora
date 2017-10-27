module ApplicationHelper
  def flash_type(type)
     return 'danger' if type == 'alert'
     return 'danger' if type == 'error'
     return 'success' if type == 'notice'
  end

  def admin_active_menu(obj)
    return 'active' if controller_name == obj
  end

  def sortable(column, title=nil, type=nil)
    title ||= column.titleize
    direction = (column == params[:sort] && params[:direction] == "asc") ? "desc" : "asc"
   link_to(title, :sort => column, :direction => direction)
  end

  def order_item
   [["Alphabetically : A-Z", "name"],
    ["Alphabetically : Z-A", "name desc"],
    ["Date : New to Old", "updated_at"],
    ["Date : Old to New", "updated_at desc"]]

  end

  def welcome_text
    str = ""
    str = str + "#{link_to raw("<i class='icon fa fa-sign-out'></i> Sign Out"),
                           logout_path, :method => :Delete}"
    str = str + "#{link_to raw("<i class='icon fa fa-user user'  style='min-height:44px'></i>
                                #{current_user.name.titleize}"), admin_path}"
  end

  def manage_banner
    current_user.nil? ? "normal" : "with-user-bar"
    #!nil ? "normal" : "with-user-bar"
  end

  def manage_menu
    puts "---------"
    puts current_user.inspect
    current_user.nil? ? "normal" : "with-user-bar"
    #!nil ? "normal" : "with-user-bar"
  end

  def service_banner
    return "suitcase" if @service.permalink == "other-service"
    return "mice"
  end
end
