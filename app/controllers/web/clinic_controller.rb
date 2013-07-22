class Web::ClinicController < ApplicationController	
  def articles
    #@article = Article.find(params[:id])
  end

	def about_us
		render 'static/clinic' and return
	end
end
