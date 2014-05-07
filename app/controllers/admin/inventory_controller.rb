class Admin::InventoryController < ApplicationController

  # before filters
  before_filter :authenticate_access

  # Helper Methods
  helper_method :sort_column, :sort_direction

  # Use the Admin layout defined in the views
  layout "admin"

  # Index Action when someone loads the inventory/index action
  def index
    if params[:pending]
      @inventory = Bus.not_deleted.includes_in.where(:status => 'pending')
      .order(sort_column + " " + sort_direction)
      .paginate :page => params[:page], :per_page => params[:per_page]
    else
      @inventory = Bus.inventory.not_deleted.includes_in
      .order(sort_column + " " + sort_direction)
      .paginate :page => params[:page], :per_page => params[:per_page]

    end
    @live = Bus.where(:live => "yes").not_deleted.includes_in.count
    @show = ManageViews.first
  end

  def show
    @inventory = Bus.find(params[:id])
  end

  # Inventory New Action
  def new
    @inventory = Bus.new
    @inventory.build_seller
    @lead = @inventory.leads.build
    @image = Image.new
    @bus_type = BusType.new
    @chasis_make = ChasisMake.new
    @body_make = BodyMake.new
  end

  # Inventory Edit Action 
  # /inventory/1/edit
  def edit
    @inventory = Bus.find(params[:id], :include => :seller)
    @seller = @inventory.seller
    @image = @inventory.images.build

    @leads = @inventory.leads
    @bus_type = BusType.new
    @chasis_make = ChasisMake.new
    @body_make = BodyMake.new
    #Chart
    @data = Array.new
    @data = (Date.today-30..Date.today).map { |date| ["#{date}", Stat.visits_on(date, params[:id])] }
  end

  # Create action for inventory 
  def create
    if params[:inventory][:state].blank?
      params[:inventory][:state] = nil
    end
    state_id = params[:inventory][:state].to_i unless params[:inventory][:state].blank?
    seller = params[:inventory][:seller]
    params[:inventory] = params[:inventory].reject! { |key, value| key == "seller" || key == "state" }
    @inventory = Bus.new(params[:inventory])
    add_seller = Seller.new(seller)
    add_seller.save
    @inventory.state_id = state_id
    @inventory.seller_id = add_seller.id
    @inventory.rear_luggage = "No" if params[:inventory][:rear_luggage].blank?
    @inventory.live = "no" if  params[:inventory][:status] == "pending"
    @images = params[:images]
    @bus_type = BusType.new
    @chasis_make = ChasisMake.new
    @body_make = BodyMake.new
    update_history_attributes(@inventory)
    if !@images.nil?
      @images.each do |image|
        image = Image.find(image[1])
        @inventory.images << image
      end
    end
    if @inventory.save
      redirect_to(admin_inventory_index_path(:per_page => 10), :notice => "The Vehicle Was Added Successfully!")
    else
      render new_admin_inventory_path, :notice => "There was some problem saving the vehicle details. Please contact Technical Support."
    end
  end

  # Inventory Update Action
  def update
    @inventory = Bus.find(params[:id])
    @image = @inventory.images
    @leads = @inventory.leads
    @bus_type = BusType.new
    @chasis_make = ChasisMake.new
    @body_make = BodyMake.new

    update_history_attributes(@inventory)

    respond_to do |format|
      if @inventory.update_attributes(params[:bus])
        @inventory.update_attributes(:live => "no") if  params[:bus][:status] == "pending"
        format.html { redirect_to admin_inventory_index_path(:per_page => 10), notice: 'Inventory was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit", notice: "Please fix the below errors:" }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # destroy action
  def destroy
    items = Bus.where(stock_id: eval(params[:ids])) if params[:ids].present?
    item = Bus.find(params[:id]) if params[:id].present?

    if items && items.each { |inv| inv.update_attribute(:deleted_at, db_time) }
      txt = 'Items'
    elsif item && item.update_attribute(:deleted_at, db_time)
      txt = 'Item'
    end
    flash[:notice] = txt+" Successfully Moved To Recycle Bin"
    redirect_to(:back) #(:per_page => 10)
  end

  def search
    @search_array = params[:search]
    @show = ManageViews.first
    if params[:search]
      @inventory ||= find_buses_backend
    else
      @inventory = Bus.order(sort_column + " " + sort_direction).paginate :page => params[:page], :per_page => params[:per_page]
    end
    if current_admin
      render :index
    else
      render "listings/show"
    end
  end


  protected

  def update_history_attributes(inventory)
    @inventory.status = params[:bus][:status] unless params[:bus].blank?
    @inventory.status = params[:inventory][:status] unless params[:inventory].blank? or params[:inventory][:status].blank?
    begin
      user = current_user.email if current_user
      user = current_admin.email if current_admin
    rescue
      user = "Undefined User or Visitor"
    end
    if @inventory.status_changed?
      @inventory.status_updated_at = DateTime.now
      @inventory.last_status_change_by = user
    end
    @inventory.created_by = user if @inventory.new_record?
    @inventory.last_modified_by = user
  end

end
