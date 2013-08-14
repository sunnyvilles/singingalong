class Web::AcademyController < ApplicationController	
	before_filter :collect_tags
	def collect_tags
		@all_tags = Tag.select("title")
	end
	def about_us
		render 'web/academy/about' and return
	end

	def articles
  	per_page = 10
  	page = params[:page].to_i == 0 ? 1 : params[:page].to_i
  	start_value = (page - 1 )*per_page

    if params[:order]=="views"

			@articles = Article.find(:all, :conditions => [ "source = ? and type=?", "academy","article" ], :order => 'viewcount DESC', :offset => start_value, :limit => per_page)
			@total_articles = Article.find(:all, :conditions => [ "source = ? and type=?", "academy", "article" ])
			@total_articles_remain = @total_articles.size - start_value

    else

			@articles = Article.find(:all, :conditions => [ "source = ? and type=?", "academy","article" ], :order => 'created_at DESC', :offset => start_value, :limit => per_page)
			@total_articles = Article.find(:all, :conditions => [ "source = ? and type=?", "academy", "article" ])
			@total_articles_remain = @total_articles.size - start_value

    end
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

    @case_studies = Article.find(:all, :conditions => [ "source = ? and type=?", "academy","case study" ], :order => 'created_at DESC', :offset => start_value, :limit => per_page)

    @total_case_studies = Article.find(:all, :conditions => [ "source = ? and type=?", "academy", "case study" ])
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


    @videos = Article.find(:all, :conditions => [ "source = ? and type=?", "academy","video" ], :order => 'created_at DESC', :offset => start_value, :limit => per_page)

    @total_videos = Article.find(:all, :conditions => [ "source = ? and type=?", "academy", "video" ])
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

	def about

	end

	def aim

	end

	def team
		@people = Doctor.get_people
	end

	def association

	end

	def knowledge_center

	end


	def our_approach

	end
	def learning_model

	end
	def teaching_tools
		
	end
	def facilities
		
	end
	def courses
	end
	def international_courses
		@international_courses = Admin::Course.find(:all, :conditions => [ "course_type = ?", "international courses"])

	end
	def customized_courses
		@customized_courses = Admin::Course.find(:all, :conditions => [ "course_type = ?", "customized courses"])

	end
	def indian_courses
		
		@basic_courses = Admin::Course.find(:all, :conditions => [ "course_type = ?", "basic courses"])

	end
	def admissions
		
	end
	def satellite

	end
end


