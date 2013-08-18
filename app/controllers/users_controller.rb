class UsersController < ApplicationController

layout 'user'

  before_filter :confirm_logged_in, :except => [:index,:new, :create]
  
  def index

    if mobile_device?
      render(:template=>'home/index_mobile' , :layout => false)
    else
		@page_title = "Home"
		@recent_activity = Article.get_recent_activity
    render(:template=>'home/index')
    end
  end
  

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = 'user created.'
      redirect_to(:controller=>'access', :action => 'login')
    else
      render("new")
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = 'user updated.'
      redirect_to(:controller=>'access', :action => 'menu')
    else
      render("edit")
    end
  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "user destroyed."
    redirect_to(:controller=>'access', :action => 'menu')
  end
end
