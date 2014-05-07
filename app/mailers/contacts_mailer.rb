class ContactsMailer < ActionMailer::Base
  default from: Settings.get(:stock_contact_email)

  def lead_email(stock, user)
    @stock = stock
    @user = user
    mail(:to => Settings.get(:stock_contact_email), :subject => "Stock ID: #{@stock.stock_id} | New Query")
  end

  def new_contact(user)
    @user = user
    mail(:to => Settings.get(:stock_contact_email), :subject => "Contact Form Filled!")
  end

  def send_friend_mail friend
    @friend = friend
    mail(:from => friend[:email], :to => friend[:friends_email])
  end

  def send_inquiry_received_email name,email
    @name = name
    @email = email
    mail(:to => email, :subject => "Inquiry Received")
  end
  def send_inquiry_received_admin name,email,comments
    @name = name
    @email = email
    @comments = comments
    mail(:to => Settings.get(:stock_contact_email), :subject => "Inquiry Received")
  end

end
