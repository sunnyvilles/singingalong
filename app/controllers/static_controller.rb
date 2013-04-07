class StaticController < ApplicationController
	def contact_us
		
	end		
		
	def about_us
		render ('static/about_us/' + params[:pages])	
	end
		
	def events
		render ('static/events/' + params[:pages])
	end
	
	def general_information
		render ('static/general_information/' + params[:pages])
	end

	def knowledge_center
		render ('static/knowledge_center/' + params[:pages])
	end

	def latest_at_the_other_song
		render ('static/latest_at_the_other_song/' + params[:pages])
	end
		
	def our_edge
		render ('static/our_edge/' + params[:pages])	
	end
	

end