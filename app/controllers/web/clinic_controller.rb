class Web::ClinicController < ApplicationController	
  def articles
    @articles = Article.find(:all, :order => 'created_at DESC')# :limit => 10)

    current_page = params[:page] || 1
	per_page = 5
	@articles = WillPaginate::Collection.create(current_page, per_page, @articles.size) do   |pager|
	pager.replace(@articles)
    
  end
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
