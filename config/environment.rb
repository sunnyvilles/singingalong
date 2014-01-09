# Load the rails application
require File.expand_path('../application', __FILE__)

ActionMailer::Base.smtp_settings = {
	:address=>              'smtpauth.theothersong.com',
  :port=>                 587,
	:domain=>               'theothersong.com',
	:user_name=>             'webadmin@theothersong.com',
	:password=>               'Vital123$',
  :authentication=>       'plain',
  :enable_starttls_auto=> true
}
# Initialize the rails application
TheOtherSongClinic::Application.initialize!
