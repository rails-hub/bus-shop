class Admin::BusTypesController < ApplicationController
  before_filter :authenticate_access
  def new
    @bus_type = BusType.new
  end
  
  def create
    @bus_type = BusType.new(params[:bus_type])
    if @bus_type.save
      render :text => "Added new Bus type Successfully!"
    else
      render :text => "Error saving Record!"
    end
  end
  
  def edit
    @bus_type = BusType.find(params[:id])
  end
  
  def update
    @bus_type = BusType.find(params[:id])
    if @bus_type.update_attributes(params[:bus_type])
      redirect_to(admin_bus_type_path, :notice => "Bus Type Updated Successfully!")
    else 
      render :edit
    end
  end
end
