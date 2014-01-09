# Load the rails application
require File.expand_path('../application', __FILE__)

Coolio::Application.configure do

  # Action Mailer config
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.smtp_settings = {
    :address => '127.0.0.1',
    :port => 25,
  }

end

# Initialize the rails application
Coolio::Application.initialize!

