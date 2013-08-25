class StaticController < ApplicationController
	layout 'application'
		
	
	def contact_us
		
	end	
		
		
	
	
	def latest_at_the_other_song
		render ('static/latest_at_the_other_song/' + params[:pages])
	end
	
	def submit_feedback
		#save inquiry and redirect to refferrer
		redirect_to request.referer
	end
end