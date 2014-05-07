class ListingsController < ApplicationController
  before_filter :count_hits
  layout "new_desgin"

  def index
    @bus_types = BusType.all
    order = params[:sort].blank? ? 'created_at-ASC' : params[:sort]
    if params[:search_field]
      @q = BusType.find_by_slug(params[:search_field]).buses.where(:live => "yes").order(order.gsub('-', ' ')).search(params[:q]) rescue Bus.where(:live => "yes").order(order.gsub('-', ' ')).search(params[:q])
    else
      unless params["q"].blank?
        params[:q][:live_eq] = "yes"
        params[:q][:state_id_eq] = params[:q][:state_id_eq].to_i unless params[:q][:state_id_eq].blank?
        params[:q][:passengers_gteq] = params[:q][:passengers_lteq].to_i == 1000 ? 50 : params[:q][:passengers_lteq].to_i - 10 unless params[:q][:passengers_lteq].blank?
      end
      bus_type = BusType.find_by_slug(params[:slug])
      @q = Bus.where(:live => "yes", :bus_type_id => '').order(order.gsub('-', ' ')).search(params[:q]) if bus_type.blank? and params[:slug].present?
      @q = BusType.find_by_slug(params[:slug]).buses.where(:live => "yes").order(order.gsub('-', ' ')).search(params[:q]) rescue Bus.where(:live => "yes").order(order.gsub('-', ' ')).search(params[:q]) unless bus_type.blank? and params[:slug].present?
    end
    if params[:search_field] and BusType.find_by_slug(params[:search_field]).blank?
      @all = [].paginate :page => params[:page], :per_page => params[:display].blank? ? 20 : params[:display]
    else
      @all = @q.result(:distinct => true).paginate :page => params[:page], :per_page => params[:display].blank? ? 20 : params[:display]

    end
  end


  def show

    @bus_types = BusType.all
    @listing = Bus.where(:live => "yes").find_by_stock_id(params[:id]) || not_found
    @related_buses= @listing.bus_type.buses.order("RAND()").limit(3)
    @lead = @listing.leads.build
    @compare_list = Bus.where(:stock_id => session[:buses])
    respond_to do |format|
      format.html
      format.pdf do
        #pdf = ListingPDF.new(@listing, view_context)
        pdf = ListingPDF.new(view_context)
        unless dealer_signed_in?
          pdf.pdf_for_bus(@listing)
        else
          pdf.pdf_for_bus(@listing, current_dealer)
        end
        send_data pdf.render, filename: "#{@listing.stock_id}_EXPORT.pdf", type: "application/pdf", disposition: "inline"
      end
    end
  end

  def send_mail_to_friend
    ContactsMailer.send_friend_mail(params[:friend]).deliver
    flash[:notice] = "Mail sent Successfully"
    redirect_to params[:friend][:friends_url]
  end

  def send_inquiry_received_email
    ContactsMailer.send_inquiry_received_email(params[:inquirename], params[:inquiremail]).deliver
    ContactsMailer.send_inquiry_received_admin(params[:inquirename], params[:inquiremail], params[:comments]).deliver
    flash[:notice] = "Inquiry Received"
    redirect_to "/listings/#{params[:back_to]}"
  end

  def search
    index
    render :index
  end
end
