class Admin::SearchController < ApplicationController
  before_filter :authenticate_access
  helper_method :sort_column, :sort_direction
  layout 'admin'
  
  def index
    @buses = Bus.is_live
    
    if params[:search_in] == 'leads'
      @leads
      %w{first_name last_name email company country province}.each do |column|
        method = 'search_by_' + column
        @leads = Lead.send(method.to_sym, params, sort_column, sort_direction) if @leads.blank? 
      end
      render "admin/leads/index"
    else
      @inventory = Bus.includes_in.includes([:seller])
                      .where("stock_id             like :search or 
                              sellers.email        like :search or 
                              sellers.name         like :search or 
                              sellers.company_name like :search 
                              or sellers.phone     like :search", search: "%#{params[:query]}%")
                      .order('buses.'+sort_column + " " + sort_direction)
                      .paginate :page => params[:page], :per_page => 10

      @show = ManageViews.first
      render "admin/inventory/index"
    end  
  end
  
end
