class Admin::StatsController < ApplicationController
  layout "admin"
  before_filter :authenticate_access
  
  def show
    @bus = Bus.find(params[:id])
    @data = Array.new
    @data = (Date.today-30..Date.today).map {|date| ["#{date}", Stat.visits_on(date, params[:id])]}
    @data
  end
end
