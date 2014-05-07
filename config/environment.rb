# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Buscms::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => "vibeonline",
  :password => "vibe2010",
  :domain => "vibe-online.com",
  :address => "smtp.sendgrid.net",
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}