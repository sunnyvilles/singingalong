class StaticController < ApplicationController
	layout 'application'
	
	def contact_us
		
	end
	
	def file_delete
		
		ext = ".jpg"
		
		if (request.format== "pdf")
			ext = ".pdf"
		end
		
		File.delete(Rails.root.join('public' + ("/" + params[:file].to_s + ext)))
		flash[:notice] = "Successfully deleted the file."
		
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

		FeedbackMailer.feedback_mail(params).deliver
		if @msg.valid? && @msg.deliver
				#redirect_to request.referer, :notice => 'Feedback submitted.'
				render :json => {:success => true}
		else
				#redirect_to request.referer, :notice => 'Feedback could not be submitted this time, please try again.'
				render :json => {
					:success => false,
					:msg => @msg.to_json
				}
		end
		FeedbackMailer.feedback_mail(params).deliver
		
	end
end