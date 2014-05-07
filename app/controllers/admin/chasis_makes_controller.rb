class Admin::ChasisMakesController < ApplicationController
    before_filter :authenticate_access
  
  def new
    @chasis_make = ChasisMake.new
  end
  
  def create
    @chasis_make = ChasisMake.new(params[:chasis_make])
    if @chasis_make.save
      render :text => "Added new Chasis Make type Successfully!"
    else
      render :text => "Error saving Record!"
    end
  end
  
  def edit
    @chasis_makes = ChasisMake.find(params[:id])
  end
  
  def update
    @chasis_make = ChasisMake.find(params[:id])
    if @chasis_make.update_attributes(params[:chasis_make])
      redirect_to(admin_chasis_makes_path, :notice => "Chasis Make Updated Successfully!")
    else 
      render :edit
    end
  end
end