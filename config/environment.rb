# Load the rails application
require File.expand_path('../application', __FILE__)


ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['SENDGRID_USERNAME'],
  :password       => ENV['SENDGRID_PASSWORD'],
  :domain         => 'heroku.com',
  :enable_starttls_auto => true
}

#ActionMailer::Base.raise_delivery_errors = true
#ActionMailer::Base.perform_deliveries = true
#
#ActionMailer::Base.delivery_method = :smtp
#ActionMailer::Base.smtp_settings = {
#	:address=>              'smtpauth.theothersong.com',
#  :port=>                 587,
#	:domain=>               'theothersong.com',
#	:user_name=>             'webadmin@theothersong.com',
#	:password=>               'Vital123$',
#  :authentication=>       'plain',
#  :enable_starttls_auto=> true,
#	:openssl_verify_mode => 'none'
#}
# Initialize the rails application
TheOtherSongClinic::Application.initialize!
