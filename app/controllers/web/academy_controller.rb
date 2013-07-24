class Web::AcademyController < ApplicationController	
  def articles
   @articles = Article.find(:all, :order => 'created_at DESC', :limit => 10)
  end

	def about_us
		render 'web/academy/about' and return
	end
end
