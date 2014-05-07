class ContactController < ApplicationController

  
  def show
    #TBA
  end
  
  def index
    @contact = Contact.new
  end
  
  def new
    #TBA
  end
  
  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      ContactsMailer.new_contact(@contact).deliver
      redirect_to(contact_path, :notice => "Thanks for contacting us, We'll get in touch soon!")
    else
      render :new, :alert => "There were some errors"
    end
  end
  
  def new_lead
    back = request.referrer
    @lead = Lead.new(params[:lead])
    if @lead.save
      @stock = Bus.find(params[:lead][:bus_id])
      ContactsMailer.lead_email(@stock, @lead).deliver
      redirect_to back, :notice => "Contact Query Sent Successfully!"
    else
      flash[:errors] = @lead.errors.messages
      redirect_to back, :alert => "We were unable to send out your query because there were some errors!"
    end
  end
end
