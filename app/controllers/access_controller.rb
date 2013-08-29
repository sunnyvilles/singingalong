class AccessController < ApplicationController



	layout "admin/application"

  before_filter :confirm_logged_in, :except => [:login, :attempt_login]
  
  def index
    login
    render('login')
  end
  
  def menu
    # display text & links
  end

  
  def attempt_login
    
    authorized_user = User.authenticate(params[:email], params[:password])
    if authorized_user
      session[:user_id] = authorized_user.id
      #session[:username] = authorized_user.username 
      session[:email]= authorized_user.email
      flash[:notice] = "You are now logged in."
      # check isAdmin for admin_users then redirect
            if (!is_admin?)
              redirect_to "/clinic"    
            else
             redirect_to "/admin"
            end
      
    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to request.referer
    end
  end

	def login
		render "/admin/shared/login"
	end
	
  def logout
    session[:user_id] = nil
    session[:email] = nil
    flash[:notice] = "You have been logged out."
    redirect_to(:action => "login")
  end

  def user_logout
  
    session[:user_id] = nil
    session[:email] = nil
    #flash[:notice] = "You have been logged out."
    redirect_to("/")
  end
end
