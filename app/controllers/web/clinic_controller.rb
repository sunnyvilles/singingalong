class Web::ClinicController < ApplicationController
	before_filter :collect_tags
	def collect_tags
		@all_tags = []#Tag.select("title")



		if params[:action] == "case_studies"
			@arts = Article.find(:all, :conditions => [ "source = ? and type = ?", "clinic", "case study" ])
		elsif params[:action] == "videos"
			@arts = Article.find(:all, :conditions => [ "source = ? and type = ?", "clinic", "video" ])
		else
			@arts = Article.find(:all, :conditions => [ "source = ? and type = ?", "clinic", "article"])
		end

		@arts.each do |art|
			art.tags.each do |tag|
				unless @all_tags.include? tag
					@all_tags << tag
				end
			end
		end
	end


  def articles
  	per_page = 10
  	page = params[:page].to_i == 0 ? 1 : params[:page].to_i
  	start_value = (page - 1 )*per_page

    if params[:order]=="views"

			@articles = Article.find(:all, :conditions => [ "source = ? and type=?", "clinic","article" ], :order => 'viewcount DESC', :offset => start_value, :limit => per_page)
			@total_articles = Article.find(:all, :conditions => [ "source = ? and type=?", "clinic", "article" ])

		elsif params[:category]

			tagname = Tag.where(:title=>params[:category]).first
 			@articles = tagname.articles.find(:all, :conditions => [ "source = ? and type=?", "clinic","article" ], :order => 'created_at DESC', :offset => start_value, :limit => per_page)
			@total_articles = tagname.articles.find(:all, :conditions => [ "source = ? and type=?", "clinic", "article" ])

    	else

			@articles = Article.find(:all, :conditions => [ "source = ? and type=?", "clinic","article" ], :order => 'created_at DESC', :offset => start_value, :limit => per_page)
			@total_articles = Article.find(:all, :conditions => [ "source = ? and type = ?", "clinic", "article" ])


    end

		@total_articles_remain = @total_articles.size - start_value

  end



	def article
		@article = Article.find(params[:article_id])
		@article.viewcount = @article.viewcount.to_i +  1.to_i
		@article.save
	end

	def case_studies

  	per_page = 10
  	page = params[:page].to_i == 0 ? 1 : params[:page].to_i
  	start_value = (page - 1 )*per_page

		if params[:category]
			tagname = Tag.where(:title=>params[:category]).first
			@case_studies = tagname.articles.find(:all, :conditions => [ "source = ? and type=?", "clinic","case study" ], :order => 'created_at DESC', :offset => start_value, :limit => per_page)
			@total_case_studies = tagname.articles.find(:all, :conditions => [ "source = ? and type=?", "clinic", "case study" ])

		else
			@case_studies = Article.find(:all, :conditions => [ "source = ? and type=?", "clinic","case study" ], :order => 'created_at DESC', :offset => start_value, :limit => per_page)
			@total_case_studies = Article.find(:all, :conditions => [ "source = ? and type=?", "clinic", "case study" ])
    end


    @total_case_studies_remain = @total_case_studies.size - start_value

  end

	def case_study
		@article = Article.find(params[:article_id])

    @article.viewcount += 1

    @article.save

	rescue => e
		logger.error( 'couldnt increase share count ' + e.to_s )
		flash[:error] = 'couldnt increase share count'
	end

	def videos
		per_page = 10
  	page = params[:page].to_i == 0 ? 1 : params[:page].to_i
  	start_value = (page - 1 )*per_page


		if params[:category]
			tagname = Tag.where(:title=>params[:category]).first
			@videos = tagname.articles.find(:all, :conditions => [ "source = ? and type=?", "clinic","video" ], :order => 'created_at DESC', :offset => start_value, :limit => per_page)
			@total_videos = tagname.articles.find(:all, :conditions => [ "source = ? and type=?", "clinic", "video" ])
		else

			@videos = Article.find(:all, :conditions => [ "source = ? and type=?", "clinic","video" ], :order => 'created_at DESC', :offset => start_value, :limit => per_page)
			@total_videos = Article.find(:all, :conditions => [ "source = ? and type=?", "clinic", "video" ])
    end
    @total_videos_remain = @total_videos.size - start_value

	end

	def video

	@article = Article.find(params[:article_id])

    @article.viewcount += 1

    @article.save

	rescue => e

		logger.error( 'couldnt increase share count ' + e.to_s )
		flash[:error] = 'couldnt increase share count'

	end
	def about_homeopathy
		
	end

	def general_information
	
	end
	def about
		@sec = "CLINIC"
 		@newses=Array.new
		
		vidn = Article.find(:all, :conditions => [ "source = ? and type = ?", "clinic", "video" ], :order => "created_at DESC", :limit => 2).reverse()
		cstn = Article.find(:all, :conditions => [ "source = ? and type = ?", "clinic", "case study" ], :order => "created_at DESC", :limit => 2).reverse()
		artn = Article.find(:all, :conditions => [ "source = ? and type = ?", "clinic", "article" ], :order => "created_at DESC", :limit => 2).reverse()


		@newses << vidn[0] unless vidn[0].nil?
		@newses << cstn[0] unless cstn[0].nil?
		@newses << artn[0] unless artn[0].nil?
		@newses << vidn[1] unless vidn[1].nil?
		@newses << cstn[1] unless cstn[1].nil?
		@newses << artn[1] unless artn[1].nil?





		@landing_events = Event.find(:all, :conditions => ["source = ? and publish = ?","clinic",true],:order => 'day ASC', :limit => 4)
		if @landing_events.size < 4 
			evs = Event.find(:all, :conditions => ["source = ?","clinic"],:order => 'day ASC', :limit => (8- @landing_events.size))
			unless evs.nil?
			evs.each do |ev|
				unless @landing_events.size >= 4 || @landing_events.include?(ev)
						@landing_events << ev 
					
				end
			end
		end
		end
		
	
	end

	def aim

	end

	def team
		@people = Doctor.get_people
	end

	def association

	end

	def virtual_tour
		
	end
	def association_wish
		
	end
	def knowledge_center

	end

	def social_sharing

    @article = Article.find(params[:article_id].to_i)

    @article.sharecount = @article.sharecount.to_i +  1.to_i

    @article.save
    respond_to do |format|
      format.html { render :layout => false }#views/web/clinic/social_sharing.html.erb
    end

  end



	def belief

	end

	def our_approach

	end
	def complimentry_therapies

	end
	def speciality_clinic

	end
	def testimonials

		@testimonials = Testimonial.where(:source=>"clinic")


	end

	def events
		per_page = 10
  	page = params[:page].to_i == 0 ? 1 : params[:page].to_i
  	start_value = (page - 1 )*per_page

    

		#@articles = Article.find(:all, :conditions => [ "type=?", "event" ], :order => 'viewcount DESC', :offset => start_value, :limit => per_page)
		#@total_articles = Article.find(:all, :conditions => [ "type=?", "event" ])

		

		#@total_articles_remain = @total_articles.size - start_value

		#deprecated code follows
		@events = Event.find(:all, :conditions => ["source = ?","clinic"],:order => 'day DESC', :offset => start_value, :limit => per_page)
		@total_events = Event.find(:all, :conditions => ["source =?","clinic"]).size
		@total_events_remain = @total_events - start_value
	end
	def event
		@event = Event.find(params[:event_id])
		if request.xhr?			
			render :layout => false and return
		end
	end
	def contact
		
	end
end
