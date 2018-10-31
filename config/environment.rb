# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Shop::Application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
      address: "smtp.gmail.com",
      port: 587,
      domain: "gmail.com",
      authentication: "plain",
      user_name: "malakhovua@gmail.com",
      password: "d28m12g2006",
      anable_starttls_auto: true
  }
end



