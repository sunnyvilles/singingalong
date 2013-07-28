class Web::ClinicController < ApplicationController	
  def articles
  	per_page = 10
  	page = params[:page].to_i == 0 ? 1 : params[:page].to_i
  	start_value = (page - 1 )*per_page
    

    @articles = Article.find(:all, :conditions => [ "source = ? and type=?", "clinic","article" ], :order => 'created_at DESC', :offset => start_value, :limit => per_page)
    
    @total_articles = Article.find(:all, :conditions => [ "source = ? and type=?", "clinic", "article" ])
    @total_articles_remain = @total_articles.size - start_value

  end

	def article

    @article = Article.find(params[:article_id])
	puts "aaaaaaaaaaaaaaaa share count " + @article.viewcount.to_s

    @article.viewcount += 1

    @article.save

  rescue => e
  logger.error( 'couldnt increase share count ' + e.to_s )
  flash[:error] = 'couldnt increase share count'
 
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
