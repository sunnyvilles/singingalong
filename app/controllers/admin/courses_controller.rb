class Admin::CoursesController < ApplicationController
  # GET /admin/courses
  # GET /admin/courses.json
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
    @admin_course = Admin::Course.new(params[:admin_course])

    respond_to do |format|
      if @admin_course.save
        format.html { redirect_to @admin_course, notice: 'Course was successfully created.' }
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
    @admin_course = Admin::Course.find(params[:id])

    respond_to do |format|
      if @admin_course.update_attributes(params[:admin_course])
        format.html { redirect_to @admin_course, notice: 'Course was successfully updated.' }
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

    respond_to do |format|
      format.html { redirect_to admin_courses_url }
      format.json { head :no_content }
    end
  end
end
