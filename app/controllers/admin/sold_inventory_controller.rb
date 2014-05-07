class Admin::SoldInventoryController < ApplicationController
  
  before_filter :authenticate_access
  
  # Helper Methods
  helper_method :sort_column, :sort_direction
  
  # Set default Layout
  layout 'admin'
  
  def index
    @inventory = Bus.sold_inventory.not_deleted.includes_in
                    .order(sort_column + " " + sort_direction)
                    .paginate :page => params[:page], :per_page => 10

    @show = ManageViews.first
    render "admin/inventory/index"
  end
  
  def search
    @inventory ||= find_buses_backend
    if current_admin
      render :index
    else
      render "listings/show"
    end
  end
  
end
