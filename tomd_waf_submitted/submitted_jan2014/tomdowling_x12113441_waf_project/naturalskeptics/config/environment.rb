# Load the rails application
require File.expand_path('../application', __FILE__)

#require 'development_mail_interceptor'

# Initialize the rails application
Naturalskeptics::Application.initialize!

#Use these settings for mailcatcher
mailcatcherSettings = {
    address: "localhost",
    :port => 1025,
    authentication: "plain",
    enable_starttls_auto: true
}

#use these settings for gmail
gmail_settings = {
    address: "smtp.gmail.com",
    port: 587,
    domain: "domain.of.sender.net",
    authentication: "plain",
    user_name: ENV["GMAIL_USERNAME"],
    password:  ENV["GMAIL_PASSWORD"],
    enable_starttls_auto: true
}

Naturalskeptics::Application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = mailcatcherSettings

end

#railscatcher server must be running when using mailcatcherSettings

#if email interception to gmail is required
# 1 Uncomment next line
#ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if  Rails.env.development?
# 2 Uncomment  the (development_mail_interceptor)  require statement above
# See development_mail_interceptor in the lib directory

#ENV variables are set with the figaro gem
# See config/application.yml  for gmail password settings