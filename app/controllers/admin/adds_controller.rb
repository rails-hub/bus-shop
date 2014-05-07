class Admin::AddsController < ApplicationController
  before_filter :authenticate_access
  layout "admin"

  def index
    @adds = Add.all
    @show = ManageViews.first
    respond_to do |format|
      format.html
    end

  end

  def new
    @add = Add.new
    @client = Client.new
    respond_to do |format|
      format.html
    end
  end

  def edit
    @add = Add.find params[:id]
    @client = @add.client
    respond_to do |format|
      format.html
    end
  end

  def create
    if !params[:add][:image].blank?
      size_priority = params[:add][:priority].gsub(' - ', '').split('Priorty')
      @add = Add.new(:name => params[:add][:name], :priority => size_priority[1].to_i, :size => size_priority[0].to_s, :status => params[:add][:status], :url => params[:add][:url], :image => params[:add][:image], :start => params[:add][:start], :end => params[:add][:end])
      @client = Client.new(params[:add][:client])
      respond_to do |format|
        @add.image = params[:add][:image]
        if @client.save
          @add.client_id = @client.id
          @add.save
          format.html { redirect_to admin_adds_path }
        else
          format.html { redirect_to :action => "new" }
        end
      end
    else
      respond_to do |format|
        flash[:error] = "Please Upload an Image for this Ad"
        format.html { redirect_to :action => "new" }
      end
    end

  end

  def update
    @add = Add.find params[:id]
    if !params[:add][:image].blank? or !@add.image.blank?
      size_priority = params[:add][:priority].gsub(' - ', '').split('Priorty')
      @add.update_attributes(params[:add].except(:client))
      @add.update_attributes(:priority => size_priority[1].to_i, :size => size_priority[0].to_s)
      @client = @add.client.update_attributes(params[:add][:client])
      respond_to do |format|
        format.html { redirect_to admin_adds_path }
      end
    else
      respond_to do |format|
        flash[:error] = "Please Upload an Image for this Ad"
        format.html { redirect_to "/admin/adds/#{@add.id}/edit" }
      end
    end

  end

  def destroy
    @add = Add.find_by_id(params[:id])
    if @add
      @add.destroy
    end
  end

  def filter
    paras = params.reject! {|key,value| value == '' or key == 'utf8' or key == 'controller' or key == 'action' or key == 'commit'}
    @adds = Add.where(paras)
    render :index
  end

  def delete_bulk_ads
    begin
      params[:ids].gsub(']', '').gsub('[', '').gsub("'", '').split(',').each do |f|
        @add = Add.find_by_id(f)
        @add.destroy
      end
      redirect_to '/admin/adds'
    rescue => error
      flash[:error] = "Error occurred while saving "
    end
  end

end