class Admin::BodyMakesController < ApplicationController
  before_filter :authenticate_access
  def new
    @body_make = BodyMake.new
  end
  
  def create
    @body_make = BodyMake.new(params[:body_make])
    if @body_make.save
      render :text => "Added new body make Successfully!"
    else
      render :text => "Error saving Record!"
    end
  end
  
  def edit
    @body_make = BodyMake.find(params[:id])
  end
  
  def update
    @body_make = BodyMake.find(params[:id])
    if @body_make.update_attributes(params[:bus_type])
      redirect_to(admin_body_makes_path, :notice => "Body Make Updated Successfully!")
    else 
      render :edit
    end
  end
end
