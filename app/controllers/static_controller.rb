class StaticController < ApplicationController
	layout 'application'
	
	def contact_us
		
	end
	
	def file_delete
	
		ext = ".jpg"
		
		if (request.format== "pdf")
			ext = ".pdf"
		end
		
		File.delete(Rails.root.join('public' + ("/"+params[:file].to_s + ext)))
		flash[:notice] = "Successfully destroyed post."
		
	end
	
	def latest_at_the_other_song
		render ('static/latest_at_the_other_song/' + params[:pages])
	end
	
	def submit_feedback
		#settings
    	#from which email : fill required fields in config/environment/development.rb or production.rb
    	#to which email : fill frequired information in app/model/message.rb file
    	#change template : app/views/mail_form/contact.erb
    	
		@msg = Message.new(:name=>params[:name],:email=>params[:email],:feedback=>params[:feedback],:mail_to=>params[:mail_to])
		
		#if @msg.spam?
      	#	redirect_to request.referer, :notice => 'Feedback could not be submitted this time, please try again.'

		#end


		if @msg.valid? && @msg.deliver
      		redirect_to request.referer, :notice => 'Feedback submitted.'
    	else
      		redirect_to request.referer, :notice => 'Feedback could not be submitted this time, please try again.'
    	end
		
	end
end