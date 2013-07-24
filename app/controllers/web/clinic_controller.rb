class Web::ClinicController < ApplicationController	
  def articles
    @articles = Article.find(:all, :order => 'created_at DESC', :limit => 10)
  end


	def about
		
	end

	def aim
		
	end

	def team
		
	end

	def association

	end


	def knowledge_center

	end
end
