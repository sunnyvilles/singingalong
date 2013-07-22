class Web::AcademyController < ApplicationController	
  def articles
    #@article = Article.find(params[:id])
  end

	def about_us
		render 'web/academy/about' and return
	end
end
