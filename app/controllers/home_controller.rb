class HomeController < ApplicationController
  layout "new_desgin"

  def index
    @var = "Welcome ! Under Construction! "
  end

  def services

  end

  def about

  end

  def contact

  end

  def show
    # TODO: Duplication here - Refactor
    @bus_types = BusType.all
    @bus_type = BusType.find_by_slug(params[:slug]) || not_found
    @all = @bus_type.buses.where(:live => "yes").paginate :page => params[:page], :per_page => 5
    @compare_list = Bus.where(:stock_id => session[:buses])
    #binding.pry
  end

  def addtocompare
    session[:buses] ||= Array.new
    if session[:buses].try(:count) < 7
      session[:buses] = session[:buses].push(params[:id]).uniq
    end
    @compare_list = Bus.where(:stock_id => session[:buses])
    render :partial => 'shared/compare_added_buses'
    #redirect_to (request.referer)?(request.referer):root_path , :notice => "Added to compare list"
  end

  def compare
    @bus_types = BusType.all
    @listing = Bus.where(:stock_id => session[:buses]) if session[:buses]
    if session[:buses].blank?
      flash[:notice] = "No buses added for comparision"
      redirect_to "/"
    end
  end

  def removefromcompare
    session[:buses].delete_at(session[:buses].find_index(params[:id]))
    if request.xhr?
      @compare_list = Bus.where(:stock_id => session[:buses])
      render :partial => 'shared/compare_added_buses'
    else
      redirect_to request.referer, :notice => "Removed from compare list"
    end
  end

  def submit_vehicle
    @bus_types = BusType.all
    @bus = Bus.new
    @bus.images.build
    @bus.build_seller
  end

  def add_new_vehicle
    #params[:bus][:state_id] = params[:bus][:state_id].to_i
    @bus = Bus.new(params[:bus])
    random_stock = generate_stock_id_num(params[:bus][:bus_type_id])
    @bus[:stock_id] = random_stock
    @bus[:vin] = random_stock+"_BY_VISITOR"
    @bus[:status] = "pending"
    @bus[:live] = "no"
    @bus[:featured] = "no"
    @bus[:posted_price] = "sale_price"
    @bus[:created_by] = "Visitor"
    @bus[:last_status_change_by] = "Visitor"
    @bus[:luggage] = "No"
    @bus[:rear_luggage] = "No"
    @bus.live = "no" if  params[:bus][:status] == "pending"
    if @bus.save
      flash[:notice] = "Vehicle Submitted for Approval!"
      redirect_to submit_vehicle_path
    else
      @bus.build_seller (params[:bus][:seller_attributes])
      @bus.images.build (params[:bus][:images])
      flash[:alert] = "There were some errors, Please fix those before proceeding!"
      render :submit_vehicle
    end
  end

  def cron_to_update_bus_stats
    username = Settings.get('ga_username')
    password = Settings.get('ga_password')
    profile_id = Settings.get('ga_profile_id')
    Garb::Session.login(username, password)
    profile = Garb::Management::Profile.all.detect { |p| p.web_property_id == profile_id }
    @buses = Bus.all
    date = Date.today
    @buses.each do |bus|
      bus_path = "/listings/"+bus.stock_id
      result = Exits.results(profile, :start_date => date, :end_date => date, :filters => {:page_path.eql => bus_path}) unless profile.nil?
      result.to_a.each do |res|
        stat = Stat.new
        stat.visits = res.pageviews
        stat.date = date
        stat.bus_id = bus.id
        stat.save
      end if result.present?
    end
    render :text => "OK"
  end

  def generate_stock_id
    render :text => generate_stock_id_num(params[:bus_type])
  end

end
