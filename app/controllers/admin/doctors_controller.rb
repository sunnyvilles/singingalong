class Admin::DoctorsController < ApplicationController
  layout "admin/application"
	# GET /doctors
  # GET /doctors.json
		
  def index
    @doctors = Doctor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @doctors }
    end
  end

  # GET /doctors/1
  # GET /doctors/1.json
  def show
    @doctor = Doctor.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @doctor }
    end
  end

  # GET /doctors/new
  # GET /doctors/new.json
  def new
    @doctor = Doctor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @doctor }
    end
  end

  # GET /doctors/1/edit
  def edit
    @doctor = Doctor.find(params[:id])
  end

  # POST /doctors
  # POST /doctors.json
  def create
    pic_name =[]

    handle_picture_upload(params,pic_name)

    @doctor = Doctor.new(params[:doctor])

    respond_to do |format|
      if @doctor.save
        handle_picture_rename(@doctor.id,pic_name)
        format.html { redirect_to [:admin, @doctor], notice: 'Doctor was successfully created.' }
        format.json { render json: @doctor, status: :created, location: @doctor }
      else
        format.html { render action: "new" }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /doctors/1
  # PUT /doctors/1.json
  def update
    handle_picture_upload(params)
    @doctor = Doctor.find(params[:id])

    respond_to do |format|
      if @doctor.update_attributes(params[:doctor])
        format.html { redirect_to @doctor, notice: 'Doctor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctors/1
  # DELETE /doctors/1.json
  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy

    respond_to do |format|
      format.html { redirect_to [:admin, @doctor] }
      format.json { head :no_content }
    end
  end
private
  def handle_picture_upload(params,pic_name)
  if params[:doctor][:picture]
        uploaded_io = params[:doctor][:picture]
        pic_name[0] = uploaded_io.original_filename
        
        File.open(Rails.root.join('public', 'images','doctors',
            uploaded_io.original_filename), 'wb') do |file|
          file.write(uploaded_io.read)
        end
      end


  end

  def handle_picture_rename(doctor_id,pic_name)
  
    extension = File.extname(Rails.root.join('public', 'images','doctors',
          pic_name[0].to_s))

      File.rename(Rails.root.join('public', 'images','doctors',
          pic_name[0].to_s),Rails.root.join('public', 'images','doctors',
          doctor_id.to_s + extension))
  
  end
end
