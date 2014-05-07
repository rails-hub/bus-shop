class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :compare_list
  layout :layout_by_login

  # Rescue from Unsupported File Type in Prawn
  rescue_from Prawn::Errors::UnsupportedImageType, :with => :pdf_image_error

  def count_hits
    @hit = PageHit.find_or_create_by_url(request.path_info)
    if params[:action] == "show" and params[:controller] == "listings"
      bus = Bus.find_by_stock_id(@hit.get_stock_id)
      @hit.bus_id = bus.id
      bus.page_hit_id = @hit.id
      bus.save
      @hit.save
    end

    @hit.increment!(:count)
  end

  def debug_it(obj)
    logger.debug "*********************************"
    logger.debug "*********************************"
    logger.debug "*********************************"
    logger.debug "*********************************"
    logger.debug "***********#{obj.inspect}**********************"
    logger.debug "*********************************"
    logger.debug "*********************************"
    logger.debug "*********************************"
  end

  helper_method :debug_it

  def compare_list
    @compare_list = Bus.where(:stock_id => session[:buses])
  end

  def find_buses_backend
    search = params[:search]
    buses = Bus.order(sort_column + " " + sort_direction).paginate :page => params[:page], :per_page => 10
    buses = buses.where(bus_type_id: search[:bus_type_id]) if search[:bus_type_id].present?
    buses = buses.where(chasis_make_id: search[:chasis_make_id]) if search[:chasis_make_id].present?
    buses = buses.where(location: search[:location]) if search[:location].present?
    seats_lower_limit = search[:passengers]
    seats_upper_limit = search[:passengers].to_i + 10.to_i
    buses = buses.where("passengers >= ? AND passengers <= ?",
                        seats_lower_limit, seats_upper_limit) if search[:passengers].present?
    buses = buses.where(featured: search[:featured]) if search[:featured].present?
    buses = buses.where(status: search[:status]) if search[:status].present?
    buses = buses.where(live: search[:live].downcase) if search[:live].present?
    buses = buses.where(sold: search[:sold]) if search[:sold].present?
    buses = buses.where(state_id: search[:state_usa_admin]) if search[:state_usa_admin].present?
    buses = buses.where(state_id: search[:state_canada_admin]) if search[:state_canada_admin].present?
    buses = buses.where(state_id: search[:state_empty_admin]) if search[:state_empty_admin].present?
    buses = buses.where("created_at >= ?", search[:from].to_ruby_date) if search[:from].present?
    buses = buses.where("created_at <= ?", search[:to].to_ruby_date) if search[:to].present?
    buses
  end

  def find_leads_backend
    search = params[:search]
    leads = Lead.order(sort_column + " " + sort_direction).paginate :page => params[:page], :per_page => (params[:per_page]) ? (params[:per_page]) : 10
    leads = leads.where(:country => search[:country]) if search[:country].present?
    leads = leads.where(:province => search[:province]) if search[:province].present?
    leads = leads.where(:company => search[:company]) if search[:company].present?
    leads = leads.where("created_at >= ?", search[:from].to_ruby_date) if search[:from].present?
    leads = leads.where("created_at <= ?", search[:to].to_ruby_date) if search[:to].present?
    leads
  end


  def find_buses_frontend
    search = params[:search]
    buses = Bus.where(:live => "yes").paginate :page => params[:page], :per_page => 5

    buses = buses.where(live: "yes")
    buses = buses.where(bus_type_id: params[:bus_type_id])

    if search[:passengers].present?
      passengers = search[:passengers].split("-")
      buses = buses.where("passengers >= ? AND passengers <= ?", passengers[0].to_i, passengers[1].to_i)
    end

    if search[:price_range].present?
      price = search[:price_range].split("-")
      buses = buses.where("price >= ? AND price <= ?", price[0].to_i, price[1].to_i)
    end

    if search[:start_year].present? and search[:end_year]
      start_year = search[:start_year]
      end_year = search[:end_year]
      buses = buses.where("year >= ? AND year <= ?", start_year, end_year)
    end

    if search[:fuel_type].present?
      fuel_type = search[:fuel_type]
      buses = buses.where(fuel_type: fuel_type)
    end

    if search[:luggage].present?
      luggage = search[:luggage]
      buses = buses.where(luggage: luggage)
    end

    if search[:entertainment].present?
      entertainment = search[:entertainment]
      buses = buses.where(entertainment: entertainment)
    end

    if search[:wheelchair_capacity].present?
      wheelchair_capacity = search[:wheelchair_capacity].split("-")
      buses= buses.where("wheelchair_capacity >= ? AND wheelchair_capacity <= ? ", wheelchair_capacity[0].to_i, wheelchair_capacity[1].to_i)
    end

    if search[:lavatory].present?
      buses= buses.where(lavatory: search[:lavatory])
    end

    if search[:brakes].present?
      buses = buses.where(brakes: search[:brakes])
    end

    if search[:raised_roof].present?
      buses = buses.where(raised_roof: search[:raised_roof])
    end

    buses
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
    respond_to do |format|
      format.html { redirect_to "public/404.html", :status => :not_found }
    end
  end

  def pdf_image_error
    render :text => "Unable to Generate PDF", :status => 404
  end


  # Sortable Column Methods
  def sort_column

    if (params[:controller] == "admin/leads" and params[:action] != "create_blast") || params[:bin] == 'leads'
      Lead.sort_by_params(params[:sort], params[:bin])
    elsif (params[:controller] == "admin/dealers") || params[:bin] == 'dealers'
      Dealer.sort_by_params(params[:sort], params[:bin])
    elsif (params[:controller] == "admin/users") || params[:bin] == 'users'
      User.sort_by_params(params[:sort], params[:bin])
    else
      if params[:sort].present? and params[:sort].scan(".").present?
        params[:sort]
      else
        Bus.sort_by_params(params[:sort], params[:bin])
      end
    end
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

  # randomly generate a stock id for buses added by visitors.
  def generate_stock_id
    alphanumerics = [('0'..'9'), ('A'..'Z')].map { |range| range.to_a }.flatten
    return (0...8).map { alphanumerics[Kernel.rand(alphanumerics.size)] }.join
  end

  def generate_stock_id_num(type_id)
    bus_type = BusType.find_by_id(type_id)
    prefix = bus_type.name == 'Shuttle' ? 'SH':bus_type.name == 'Paratransit' ? 'PA':bus_type.name == 'Limo' ? 'LM':bus_type.name == 'School' ? 'SC': bus_type.name == 'City Transit' ? 'CT':bus_type.name == 'Van' ? 'VN':bus_type.name == 'Coach'? 'CH': bus_type.name == 'Specialty'? 'SP':nil
    alphanumerics = [('0'..'9')].map { |range| range.to_a }.flatten
    return prefix + (0...8).map { alphanumerics[Kernel.rand(alphanumerics.size)] }.join
  end


  protected

  def after_sign_in_path_for(resource)
    case resource
      when Admin then
        admin_dashboard_path
      when User then
        admin_dashboard_path
      when Dealer then
        root_path
    end
  end

  def render_admin_layout
    render :layout => "admin"
  end

  def authenticate_access
    unless admin_signed_in? or user_signed_in?
      # redirect_to admin_dashboard_path, :alert => "Access Denied!"
      redirect_to root_url, :alert => "Access Denied!"
    end
  end

  def db_time
    # return Time.now    
    return Time.now.to_s(:db)
  end

  def layout_by_login
    if controller_name == 'sessions' && action_name == 'new'
      'devise_layout'
    else
      'application'
    end
  end

  @bus_types = BusType.all
end

class ActiveSupport::TimeWithZone
  def to_app_date
    self.strftime('%b %d, %Y')
  end
end

class String
  def to_ruby_date
    Date.strptime(self, "%m/%d/%Y")
  end
end
