class Admin::ArticlesController < ApplicationController
  layout "admin/application.html"
  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json=> @articles }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json=> @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end


  # show
 def show
@article = Article.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render json: @article }
    end

  end
  # POST /articles
  # POST /articles.json
  def create
   
    puts "xxxxxxxxx" + params[:article][:id].to_s
  handle_file_upload(params)

  @article = Article.new(params[:article])
    respond_to do |format|
      if @article.save
        format.html { redirect_to [:admin,@article], :notice=> 'Article was successfully created.' }
        format.json { render :json=> @article, :status=> :created, :location=> @article }
      else
        format.html { render :action=> "new" }
        format.json { render :json=> @article.errors, :status=> :unprocessable_entity }
      end #if else
    end #do
  

  
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    handle_file_upload(params)

    @article = Article.find(params[:id])
    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to [:admin,@article], :notice=> 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action=> "edit" }
        format.json { render :json=> @article.errors, :status=> :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end

private
#fileuploadhandle
  def handle_file_upload(params)
    count = 0
3.times do
    if params[:article]["file_caption_" + count.to_s]
      uploaded_io = params[:article]["file_caption_" + count.to_s]
      File.open(Rails.root.join('public', 'images','articles',
          uploaded_io.original_filename), 'wb') do |file|
        file.write(uploaded_io.read)
      end

#params[:article][:id].to_s + "-" + count.to_s <<-- file name

      params[:article]["file_caption_" + count.to_s] = params[:article]["caption_" + count.to_s]
      #save original file names(uploaded_io.original_filename) to a public variable array and pass that to create action , rename those files there just after save
    end
    count +=1
end
    rescue => e
  logger.error( 'Upload failed. ' + e.to_s )
  flash[:error] = 'Upload failed. Please try again.'
  render :action => 'new'

  end
 
 def handle_file_rename()


 end
end