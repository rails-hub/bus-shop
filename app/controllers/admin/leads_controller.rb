class Admin::LeadsController < ApplicationController
  layout "admin"
  before_filter :authenticate_access
  helper_method :sort_column, :sort_direction
  
  def index
    session[:leads] = nil
    session[:stocks] = nil
    @leads = Lead.not_deleted
                 .order(sort_column + " " + sort_direction)
                 .paginate :page => params[:page], 
                           :per_page => params[:per_page] ? params[:per_page] : 10
    @buses = Bus.is_live
  end
  
  def show
  end
  
  def new
    @lead = Lead.new
    @buses = Bus.is_live
    render :new
  end
  
  def create
    @buses = Bus.is_live
    @lead = Lead.new(params[:lead])
    if @lead.save
      redirect_to(admin_leads_path, :notice => "Lead Added Successfully!")
    else
      render :new, :notice => "There were some errors"
    end
  end
  
  def edit
    @buses = Bus.is_live
    @lead = Lead.find(params[:id])
  end
  
  def update
    @buses = Bus.is_live
    @lead = Lead.find(params[:id])
    if @lead.update_attributes(params[:lead])
      redirect_to(admin_leads_path, :notice => "Lead Updated Successfully!")
    else 
      render :edit
    end
  end

  def send_blast
    buses = Bus.where(:stock_id => eval(params[:stocks]))
    emails = params[:leads].split(",")
    message = params[:message] if params[:message]
    subject = params[:subject] if params[:subject]
    emails.each do |lead|
       LeadsMailer.email_blast_new(buses, lead, message, subject).deliver
    end
    render "shared/leads/success"
  end
  
  def send_email
    session[:leads] = params[:leads] if params[:leads].present?
    session[:email_buses] = params[:buses] if params[:buses].present?
    if params[:email_msg].present?
      @buses = Bus.where(:stock_id => session[:email_buses])
      @leads = Lead.find(session[:leads])
      @message = params[:email_msg]
      @leads.each do |lead|
         LeadsMailer.email_blast(@buses, lead, @message).deliver
      end
    end
    render :json => :ok if session[:leads].present?
  end

  def create_blast
    @inventory = Bus.includes([:bus_type,:chasis_make, :body_make, :stats,:page_hit]).order(sort_column+ " " + sort_direction).where("status != ?", "pending").paginate :page => params[:page], :per_page => 10
    @show = ManageViews.first
    set_blast_vars
    to_raw
    render "shared/leads/create_blast_step1"
  end
  
  def remove_stock_session
    stocks = eval(params[:stocks])
    stocks.each do |s|
      session[:stocks].delete(s)
    end
    render :text => session[:stocks].count
  end
  
  def add_stock
    set_blast_vars
    to_raw
    render :text => session[:stocks].count
  end
  
  def blast_step3
    set_blast_vars
    to_raw
    render "shared/leads/create_blast_step2"
  end
  
  def search
    set_blast_vars
    to_raw
    @search_array = params[:search]
    @show = ManageViews.first
    if params[:search]
      @inventory ||= find_buses_backend
    else
      @inventory = Bus.order(sort_column + " " + sort_direction).paginate :page => params[:page], :per_page => params[:per_page]
    end 
    render "shared/leads/create_blast_step1"
  end
  
  def to_raw
    @stocks_ar = "['" + session[:stocks].collect{|l| l}.join("','") + "']" if session[:stocks]
    @leads_ar = "['" + session[:leads].collect{|l| l}.join("','") + "']" if session[:leads]
  end
  
  def search_leads
    @search_array = params[:search]
    @buses = Bus.is_live
    if params[:search]
      @leads ||= find_leads_backend
    else
      @leads = Lead.all.paginate :page => params[:page], :per_page => (params[:per_page])?(params[:per_page]):10
    end 
    render "admin/leads/index"
  end
  
  def blast_last_step
    set_blast_vars
    to_raw
    @buses_model = Bus.where(:stock_id => session[:stocks])
    @leads_model = Lead.where(:id => session[:leads])
    @emails = get_lead_emails
    session[:message] = params[:message]
    session[:subject] = params[:subject]
    render "shared/leads/blast_last_step"
  end
  
  def get_lead_emails
    @leads_model.collect{|l| l.email}.join(', ')
  end
  
  def set_blast_vars
    session[:leads] ||= Array.new
    session[:stocks] ||= Array.new
    if session[:leads]
      session[:leads] += params[:leads].split(',')
      @leads = session[:leads].uniq
      session[:leads] = session[:leads].uniq
    end
    if params[:stocks]
      session[:stocks] += eval(params[:stocks]) 
      @buses = session[:stocks].uniq
      session[:stocks] = session[:stocks].uniq
    end 
    
    
  end
  
  def destroy
    leads = Lead.where(:id => eval(params[:ids])) if params[:ids]
    lead = Lead.find(params[:id]) if params[:id]
    
    if leads && leads.each { |lead| lead.update_attribute(:deleted_at, db_time)}
      txt = 'Leads'
    elsif lead && lead.update_attribute(:deleted_at, db_time)
      txt = 'Lead'
    end
    flash[:notice] = txt+" Successfully Moved To Recycle Bin"
    redirect_to(:back)
  end


end