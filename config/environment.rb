# Load the Rails application.
require File.expand_path('../application', __FILE__)

ENV['RAILS_ENV'] ||= 'production'

# Initialize the Rails application.
Uno::Application.initialize!
I18n.enforce_available_locales = false
Paperclip.options[:command_path] = "/usr/local/bin"
# Paperclip.options[:command_path] = "${HOME}/opt/ImageMagick/bin"
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true
# ActionMailer::Base.smtp_settings = {
#   :address              => "robots.1gb.ru",
#   :port                 => "25"
# }
ActionMailer::Base.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    # :user_name            => "uno.pizzerias@gmail.com",
    :user_name            => "pizzerias.uno",
    :password             => "HhgQ938Klnv",
    :authentication       => "plain",
    :enable_starttls_auto => true
}
