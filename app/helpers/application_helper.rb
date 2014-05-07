module ApplicationHelper
  
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    page_number = params[:page]
    link_to title, params.merge(:sort => column, :direction => direction, :page => page_number), {:class => css_class}
  end
  
  def absolute_image_tag(*args)
    raw(image_tag(*args).sub /src="(.*?)"/, "src=\"#{request.protocol}#{request.host_with_port}" + '\1"')
  end

  def user_logged_in?
    if admin_signed_in? or user_signed_in?
      return true
    else
      return false
    end
  end

  def login_greet
    if admin_signed_in?
      current_admin.email
    elsif user_signed_in?
      current_user.email
    end
  end
  
  def user_session_destroy_path
    return destroy_admin_session_path if admin_signed_in?
    return destroy_user_session_path if user_signed_in?
  end
  
  def active_link?(url)
    return "active" if request.path.to_s =~ /#{url.to_s}/
  end
  
  def selected_option?(option)
    return 'selected=selected' if params[:per_page] == option.to_s
  end
  
end
