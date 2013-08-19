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
    authorized_user = User.authenticate(params[:username], params[:password])
    if authorized_user
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      flash[:notice] = "You are now logged in."
      # check isAdmin for admin_users then redirect
      redirect_to(params[:after_login].present? ? params[:after_login] : "/admin/academy/articles")
    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to(:action => 'login')
    end
  end

	def login
		render "/admin/shared/login"
	end
	
  def logout
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "You have been logged out."
    redirect_to(:action => "login")
  end
end
