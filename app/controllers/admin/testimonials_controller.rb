class Admin::TestimonialsController < ApplicationController
  layout "admin/application"
  # GET /testimonials
  # GET /testimonials.json
before_filter :confirm_logged_in
before_filter :confirm_admin

  def index
    @testimonials = Testimonial.where("source = ?", @section)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @testimonials }
    end
  end

  # GET /testimonials/1
  # GET /testimonials/1.json
  def show
    @testimonial = Testimonial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @testimonial }
    end
  end

  # GET /testimonials/new
  # GET /testimonials/new.json
  def new
    @testimonial = Testimonial.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @testimonial }
    end
  end

  # GET /testimonials/1/edit
  def edit
    
    @testimonial = Testimonial.find(params[:id])

  end

  # POST /testimonials
  # POST /testimonials.json
  def create

    @testimonial = Testimonial.new(params[:testimonial])
    @testimonial.source = @section

    respond_to do |format|
      if @testimonial.save
        format.html { redirect_to  "/admin/#{@section}/testimonials/#{@testimonial.id}/edit", notice: 'Testimonial was successfully created.' }
        format.json { render json: @testimonial, status: :created, location: @testimonial }
      else
        format.html { render action: "new" }
        format.json { render json: @testimonial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /testimonials/1
  # PUT /testimonials/1.json
  
  def update


    @testimonial = Testimonial.find(params[:id])

    respond_to do |format|
      if @testimonial.update_attributes(params[:testimonial])

        format.html { redirect_to "/admin/#{@section}/testimonials/#{@testimonial.id}/edit", notice: 'Testimonial was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @testimonial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testimonials/1
  # DELETE /testimonials/1.json
  def destroy
    
    @testimonial = Testimonial.find(params[:id])
    @testimonial.destroy

    respond_to do |format|
      format.html { redirect_to "/admin/#{@section}/testimonials" }
      format.json { head :no_content }
    end
  end
 
end
