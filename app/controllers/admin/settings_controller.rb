class Admin::SettingsController < ApplicationController
  layout "admin"
  before_filter :authenticate_access
  
  def index
    @settings = Settings.all
  end
  
  def edit
    @settings = Settings.all
  end
  
  def update_settings
    
    render :text => "Method implementation here"
  end
end
