class ArticlesController < ApplicationController
  def index

  	@articles = Article.all
    respond_to do |format|
      format.html 
      format.json { render json: @articles }
    end
  end

  def show
  @article = Article.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render json: @article }
    end

  end
end
