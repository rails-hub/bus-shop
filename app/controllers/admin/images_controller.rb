class Admin::ImagesController < ApplicationController
  before_filter :authenticate_access
  skip_before_filter :verify_authenticity_token
  
  def index

  end
  
  def show
    bus = Bus.find(params[:id])
    render :json => bus.images.collect { |p| p.to_jq_upload }.to_json
  end
  
  def new
    @image = Image.new
    render :text => "hello"
  end
  
  def create
    @picture = Image.new(params[:image])
    if params[:bus_id]
      @picture.bus_id = params[:bus_id]
    end
    if @picture.save
      render :json => [@picture.to_jq_upload].to_json
    else 
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  def destroy
    @image = Image.find(params[:id])
    if @image.delete
      render :json => true
    end
  end
  
end