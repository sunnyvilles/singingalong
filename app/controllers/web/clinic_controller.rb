class Web::ClinicController < ApplicationController	
  def articles
  	per_page = 10
  	page = params[:page].to_i == 0 ? 1 : params[:page].to_i
  	start_value = (page - 1 )*per_page
    @articles = Article.find(:all, :order => 'created_at DESC', :offset => start_value, :limit => per_page)
  end

	def article
    @article = Article.find(params[:article_id])
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
