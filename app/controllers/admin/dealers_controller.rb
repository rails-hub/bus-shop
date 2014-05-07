class Admin::DealersController < ApplicationController
  layout "admin"
  #  before_filter :authenticate_admin!
  before_filter :authenticate_access
  helper_method :sort_column, :sort_direction
  def index
    @dealers = Dealer.where('deleted_at is null')
    .order(sort_column + " " + sort_direction)
    .paginate :page => params[:page], :per_page => 10
  end
  
  def new
    @dealer = Dealer.new
  end
  
  def create
    @dealer = Dealer.new(params[:dealer])
    if @dealer.save
      redirect_to(admin_dealers_path, :notice => "Dealer Added Successfully!")
    else
      render :new, :notice => "There were some errors"
    end
  end
  
  def edit
    @dealer = Dealer.find(params[:id])
  end
  
  def destroy
    dealer = Dealer.find(params[:id]) if params[:id].present?
    dealers = Dealer.where(:id => eval(params[:ids])) if params[:ids].present?
    
    if dealers && dealers.each { |dealer| dealer.update_attributes(deleted_at: db_time)}
      txt = 'Dealers'
    elsif dealer && dealer.update_attributes!(deleted_at: db_time)
      txt = 'Dealer'
    end
    flash[:notice] = txt+" Successfully Moved To Recycle Bin"
    redirect_to(:back)   #(:per_page => 10)
  end
  
  def update
    @dealer = Dealer.find(params[:id])
    if @dealer.update_attributes(params[:dealer])
      redirect_to(admin_dealers_path, :notice => "Dealer Updated Successfully!")
    else 
      render :edit
    end
  end
  
  def confirm_account
    @dealer = Dealer.find(params[:id])
    method = "confirm!" unless @dealer.confirmed?
    method = "deactivate_account" if @dealer.confirmed?
    if @dealer.send(method)
      redirect_to(admin_dealers_path, :notice => "The Dealer Account was Activated Successfully!")
    else 
      redirect_to admin_dealers_path, :alert => "Unable to activate this account! Perhaps it's already activated?"
    end
  end

end


