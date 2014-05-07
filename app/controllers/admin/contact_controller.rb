class Admin::ContactController < ApplicationController
  before_filter :authenticate_access
  helper_method :sort_column, :sort_direction
  layout "admin"
  
  def contact
    # TBA
  end
  
  def index
    @contact = Contact.paginate :page => params[:page], :per_page => 10
    @live = Contact.all.count
  end
  
  def destroy
    @contact = Contact.find(params[:id])
    if @contact.delete
      redirect_to(admin_dashboard_path, :notice => "Contact Deleted successfully!")
    end
  end
  
  def show
    @contact = Contact.find(params[:id])
  end
  
  def new
    
  end
  
   def create
     @contact = Contact.new(params[:contact])
    if @contact.save
      redirect_to(contact_path, :notice => "You will be contacted soon!")
    else
      render :new, :notice => "There were some errors"
    end
   end
end
