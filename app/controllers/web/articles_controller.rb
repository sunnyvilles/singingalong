class Web::ArticlesController < ApplicationController

	# GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json=> @article }
    end
  end

  def social_sharing

puts "SSSSSSSSSSSSSSSSSSSSSSSs" + params[:site].to_s

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json=> @article }
          end

  end

end
