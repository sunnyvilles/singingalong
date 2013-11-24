class Admin::DoctorsController < ApplicationController
  layout "admin/application"
	# GET /doctors
  # GET /doctors.json
	before_filter :confirm_logged_in
	before_filter :confirm_admin

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

    

    @doctor = Doctor.new(params[:doctor])
		
    respond_to do |format|
      if @doctor.save
				#handle_picture_rename(params,@doctor.id,pic_name)
				params[:id] =  @doctor[:id]
				handle_picture_upload(params,pic_name)
				save_url(@doctor, params)
        format.html { redirect_to  edit_admin_doctor_path(@doctor), notice: 'Doctor was successfully created.' }
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


		file_name =[]
		handle_picture_upload(params,file_name)

    @doctor = Doctor.find(params[:id])
		save_url(@doctor, params)
    respond_to do |format|
      if @doctor.update_attributes(params[:doctor])
				#handle_picture_rename(params,@doctor.id,file_name)

        format.html { redirect_to edit_admin_doctor_path(@doctor), notice: 'Doctor was successfully updated.' }
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
		
		unless params[:doctor]["picture"].nil? || params[:doctor]["picture"].blank?
			uploaded_io = params[:doctor][:picture]
			pic_name[0] = uploaded_io.original_filename
			if Rails.env != "development"
				AWS::S3::DEFAULT_HOST.replace "s3-ap-southeast-1.amazonaws.com"
				AWS::S3::Base.establish_connection!(:access_key_id => Rails.configuration.s3Defaults[:s3_credentials][:access_key_id],
					:secret_access_key => Rails.configuration.s3Defaults[:s3_credentials][:secret_access_key])
				AWS::S3::S3Object.store(params[:id].to_s + ".jpg",
					uploaded_io,
					Rails.configuration.s3Defaults[:s3_credentials][:bucket]  + "/team-images",
					:access => :public_read,
					"Cache-Control" => "no-cache, max-age=100000,  :expires => \"Thu, 25 Jun 2020 20:00:00 GMT\"")
				puts("File created on S3 : ==== ")
			else

				File.open(Rails.root.join('public', 'images','doctors',
						uploaded_io.original_filename), 'wb') do |file|
					file.write(uploaded_io.read)
				end
			end
		end


  end

  def handle_picture_rename(params,doctor_id,pic_name)

    unless params[:doctor][:picture].nil? || params[:doctor][:picture].blank?
      File.rename(Rails.root.join('public', 'images','doctors',
          pic_name[0].to_s),Rails.root.join('public', 'images','doctors',
          doctor_id.to_s + ".jpg"))
    end
  end

	def save_url(doctor, params)
		params[:doctor_urls] = params[:doctor_urls].present? ? params[:doctor_urls] : []
		params[:doctor_urls].each{|url|
			if(!doctor.urls.where("title = ?", url).present?)
				if(url != "")
					doctor.urls.create({
							:title => url
						})
				end

			end
		}
		doctor.urls.each{|url|
			if(!params[:doctor_urls].include? url[:title])
				doctor.urls.delete(url)
			end
		}
	end
end
