class Admin::CoursesController < ApplicationController
  layout "admin/application"
	# GET /admin/courses
  # GET /admin/courses.json
  before_filter :confirm_logged_in
  before_filter :confirm_admin
  
  def index
    @admin_courses = Admin::Course.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_courses }
    end
  end

  # GET /admin/courses/1
  # GET /admin/courses/1.json
  def show
    @admin_course = Admin::Course.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_course }
    end
  end

  # GET /admin/courses/new
  # GET /admin/courses/new.json
  def new
    @admin_course = Admin::Course.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_course }
    end
  end

  # GET /admin/courses/1/edit
  def edit
    @admin_course = Admin::Course.find(params[:id])
  end

  # POST /admin/courses
  # POST /admin/courses.json
  def create

    pdf_name =[]

    handle_pdf_upload(params,pdf_name)

    @admin_course = Admin::Course.new(params[:admin_course])

    respond_to do |format|
      if @admin_course.save
        #handle_pdf_rename(params,@admin_course.id,pdf_name)
        format.html { redirect_to "/admin/academy/courses/#{@admin_course.id}/edit", notice: 'Course was successfully created.' }
        format.json { render json: @admin_course, status: :created, location: @admin_course }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/courses/1
  # PUT /admin/courses/1.json
  def update

    pdf_name =[]

    handle_pdf_upload(params,pdf_name)

    @admin_course = Admin::Course.find(params[:id])

    respond_to do |format|
      if @admin_course.update_attributes(params[:admin_course])
        #handle_pdf_rename(params,@admin_course.id,pdf_name)
        format.html { redirect_to "/admin/academy/courses/#{@admin_course.id}/edit", notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/courses/1
  # DELETE /admin/courses/1.json
  def destroy
    @admin_course = Admin::Course.find(params[:id])
    @admin_course.destroy

    #delete_files_amazon(params[:id],"courses")

    respond_to do |format|
      format.html { redirect_to admin_courses_url }
      format.json { head :no_content }
    end
  end

  private
  def handle_pdf_upload(params,pdf_name)
    unless params[:admin_course]["course_pdf"].nil? || params[:admin_course]["course_pdf"].blank?
      uploaded_io = params[:admin_course][:course_pdf]

      upload_file_amazon(params[:id].to_s + ".pdf",uploaded_io,"courses")


      # pdf_name[0] = uploaded_io.original_filename

      # File.open(Rails.root.join('public', 'files','courses',
      #     uploaded_io.original_filename), 'wb') do |file|
      #   file.write(uploaded_io.read)
      # end
    end
  end


  # def handle_pdf_rename(params,course_id,pdf_name)

  #   unless params[:admin_course][:course_pdf].nil? || params[:admin_course][:course_pdf].blank?


  #     File.rename(Rails.root.join('public', 'files','courses',
  #         pdf_name[0].to_s),Rails.root.join('public', 'files','courses',
  #         course_id.to_s + ".pdf"))
  #   end
  # end


end
