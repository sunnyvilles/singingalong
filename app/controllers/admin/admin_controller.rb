class Admin::AdminController < ApplicationController
	before_filter :confirm_logged_in, :except => [:login, :attempt_login]
	layout "admin/application"
	
	
	def show
		



		
		#if is_logged_in?
		#	if (!is_admin?)
		#		redirect_to "/clinic"
		#	end			
		#else
		#	redirect_to "/clinic"
		#end
	end
end