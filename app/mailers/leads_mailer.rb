class LeadsMailer < ActionMailer::Base
  default from: Settings.get(:stock_contact_email)
  
  def email_blast(buses, lead, email)
    @lead = lead
    @buses = buses
    @email = email
    mail(:to => lead.email, :subject => @email[:subject])
  end
  
  def email_blast_new(buses, lead, message, subject)
    @lead = lead
    @buses = buses
    @message = message
    @subject = subject
    mail(:to => @lead, :subject => @subject) do |format|
      format.html { render "leads_mailer/email_blast_new" }
    end
  end
  
  
  
end
