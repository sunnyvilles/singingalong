class StaticController < ApplicationController
	layout 'application'
	
	def academy
		#@events = Event.find(:all, :order => 'day DESC',:limit => 4)
	end
	def clinic
		#@events = Event.find(:all, :order => 'day DESC', :limit => 4)
	end

	def contact_us
		
	end		
		
	def about_us
		render ('static/about_us/' + params[:pages]) and return if params[:pages].present?
	end
		
	def events
		render ('static/events/' + params[:pages])
	end
	
	def general_information
		render ('static/general_information/' + params[:pages])  and return if params[:pages].present?
	end

	def knowledge_center
		render 'web/articles/article_list' and return if params[:pages].present? and params[:pages]=="articles"
		render ('static/knowledge_center/' + params[:pages]) and return if params[:pages].present?
	end

	def latest_at_the_other_song
		render ('static/latest_at_the_other_song/' + params[:pages])
	end
		
	def our_edge
		render ('static/our_edge/' + params[:pages]) and return if params[:pages].present?
	end
	

end