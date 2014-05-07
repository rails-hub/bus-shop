class Admin::DashboardController < ApplicationController
  
  before_filter :authenticate_access
  layout "admin"
  require 'garb'

  def index
    @contact = Contact.find(:all, :order => "id DESC", :limit => 5) #paginate :page => params[:page], :per_page => 5
    @live = Contact.all.count
    @users = User.find(:all, :order => "id DESC", :limit => 5)
    @inventory = Bus.where(:sold => 1).find(:all, :order => "id DESC", :limit => 5)
    @data = MainChart.order(:dates).last(30)
    @data.map! {|cd| ["#{cd.dates}", cd.pageviews] }
#    @pending = Bus.where(:status => 'pending')
    @buses = Bus.not_deleted.includes_in.where(:status => 'pending')
      .order(sort_column + " " + sort_direction)
  end
end


