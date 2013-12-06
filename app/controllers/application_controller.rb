class ApplicationController < ActionController::Base

	#before_filter :prepare_for_mobile
	before_filter :section
	protect_from_forgery

  protected

  	def upload_file_amazon(file_name,file,folder_name)


  		AWS::S3::DEFAULT_HOST.replace "s3-ap-southeast-1.amazonaws.com"
				AWS::S3::Base.establish_connection!(:access_key_id => Rails.configuration.s3Defaults[:s3_credentials][:access_key_id],
					:secret_access_key => Rails.configuration.s3Defaults[:s3_credentials][:secret_access_key])

				AWS::S3::S3Object.store(file_name,
					file,
					Rails.configuration.s3Defaults[:s3_credentials][:bucket]  + "/" + Rails.env + "/" + folder_name,
					:access => :public_read,
					"Cache-Control" => "no-cache, max-age=100000,  :expires => \"Thu, 25 Jun 2020 20:00:00 GMT\"")
				puts("File created on S3 : ==== ")



  	end

  	def delete_files_amazon(the_id,folder_name) #delete complete data from an event or article or team corresponding to an id

  	end


  	def section
		@section = params[:section].present? ?  params[:section] : request.fullpath.split("/")[2]
		@original_type = request.fullpath.split("/")[3]
		unless @original_type.blank?
			chk_type =  request.fullpath.split("/")[3][0..-2]
		end
		if chk_type=="case-studie"
			@type = "case study"
		else
			@type = chk_type
		end

	end

	def is_logged_in?
		return session[:user_id].present?
	end

	
	def is_admin?
		return User.find(session[:user_id]).isAdmin
	end


	def confirm_admin
		unless User.find(session[:user_id]).isAdmin
			flash[:notice] = "not admin"
      		redirect_to("/admin/login")
      		return false # halts the before_filter
      	else
      		return true
		end

	end



  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "please login"
      redirect_to("/admin/login")
      return false # halts the before_filter
    else
      return true
    end
  end
  

	private

	def mobile_device?
		if session[:mobile_param]
			session[:mobile_param] == "1"
		else
			request.user_agent =~ /Mobile|webOS/
		end
	end
	helper_method :mobile_device?

	def prepare_for_mobile
		session[:mobile_param] = params[:mobile] if params[:mobile]
		request.format = :mobile if mobile_device?
	end
end