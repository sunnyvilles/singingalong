class ApplicationController < ActionController::Base

	#before_filter :prepare_for_mobile
	before_filter :section
	protect_from_forgery



  protected
  def section
		@section =  request.fullpath.split("/")[2]
		@type =  request.fullpath.split("/")[3]
	end
  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in."
      redirect_to(:controller => 'access', :action => 'login')
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