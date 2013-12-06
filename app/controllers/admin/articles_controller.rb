class Admin::ArticlesController < ApplicationController
  layout "admin/application.html"
  # GET /articles
  # GET /articles.json
  before_filter :confirm_logged_in
  before_filter :confirm_admin

  def index

    @articles = Article.where("source = ? and type = ?", @section, @type)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json=> @articles }
    end
    
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new
    @article.doctors.build
		@all_tags = Tag.select("title")
		@tags = []
		# @article[:viewcount] = 0.to_i
		# @article[:sharecount] = 0.to_i
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json=> @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
		#TODO get tags only for this article
		@tags = @article.tags
		@all_tags = Tag.select("title")
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

    unless params[:article][:origin_type].blank?
      chk =  params[:article][:origin_type][0..-2]
    end
    if chk=="case-studie"
      @type = "case study"
    else
      @type = chk
    end

		file_names = []

		handle_file_upload(params,file_names)

		@article = Article.new(params[:article])
    @article.type = @type
    @article.source = @section

		@article.viewcount = 0.to_i

		respond_to do |format|
      if @article.save
				params[:id] = @article[:id]
        associate_tag(params)
        #handle_file_rename(@article.id,file_names)
        format.html { redirect_to "/admin/#{@section}/#{params[:article][:origin_type]}/#{@article.id}/edit", :notice=> 'Article was successfully created.' }
        format.json { render :json=> @article, :status=> :created, :location=> @article }
      else
        format.html { render :action=> "new" }
        format.json { render :json=> @article.errors, :status=> :unprocessable_entity }
      end #if else
    end #do
  end
	def associate_tag(params)
		@article = Article.find(params[:id])
		params[:tags] && params[:tags].each{|tag|
			tagObj = Tag.where("title = ?", tag)
			if(tagObj.length == 0 )					
					@article.tags.create({:title=> tag})						
			elsif(!@article.tags.where("id = ?",tagObj[0][:id]).present?) #this tag is not already associated
				#associate the tag with this article
				@article.tags << tagObj[0]
			end
		}

		@article.tags.each{|tag|
			if (!params[:tags].include? tag[:title])
				@article.tags.delete(tag)
			end
		}
	end
  # PUT /articles/1
  # PUT /articles/1.json
  def update

    unless params[:article][:origin_type].blank?
      chk =  params[:article][:origin_type][0..-2]
    end
    if chk=="case-studie"
      @type = "case study"
    else
      @type = chk
    end

    file_names=[]		
    handle_file_upload(params,file_names)

    @article = Article.find(params[:id])
		associate_tag(params)
    respond_to do |format|
      if @article.update_attributes(params[:article])
        #handle_file_rename(@article.id,file_names)
        format.html { redirect_to "/admin/#{@section}/#{params[:article][:origin_type]}/#{@article.id}/edit", :notice=> 'Article was successfully updated.' }
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

    #delete_files_amazon(params[:id],"articles")
    respond_to do |format|
      format.html { redirect_to "/admin/#{@section}/articles" }
      format.json { head :no_content }
    end
  end

	private
	#fileuploadhandle
  def handle_file_upload(params,file_names)
    count = 0
		3.times do
			if params[:article]["image_" + count.to_s]
				uploaded_io = params[:article]["image_" + count.to_s]

         upload_file_amazon(params[:id].to_s + "-" + count.to_s + ".jpg",uploaded_io,"articles")
				# File.open(Rails.root.join('public', 'images','articles',
				# 		uploaded_io.original_filename), 'wb') do |file|
				# 	file.write(uploaded_io.read)
				# end
				# ##params[:article]["file_caption_" + count.to_s] = params[:article]["caption_" + count.to_s]
     
				# file_names[count] = uploaded_io.original_filename
			end
			count +=1
		end

	rescue => e
		logger.error( 'Upload failed. ' + e.to_s )
		flash[:error] = 'Upload failed. Please try again.'
		render :action => 'new'
  end
 
	# def handle_file_rename(article_id,file_names)
	# 	id_count =0
   
 #    file_names.each { |file_name|
	# 		if file_name

	# 		File.rename(Rails.root.join('public', 'images','articles',
 #          file_name.to_s),Rails.root.join('public', 'images','articles',
 #          article_id.to_s + "-" + id_count.to_s + ".jpg"))
 #    end
 #      id_count +=1                                                       
 #    }

	# rescue => e
	# 	logger.error( 'file uploaded but file renaming failed . ' + e.to_s )
	# 	flash[:error] = 'file uploaded but file renaming failed on server. Please try again.'
	# 	render :action => 'edit'


	# end

  

end