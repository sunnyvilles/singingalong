class UsersController < ApplicationController

layout 'user'

  before_filter :confirm_logged_in, :except => [:index,:new, :create]
  
  def index
		@page_title = "Home"
    render(:template=>'home/index')
  end
  

  def new
    @admin_user = User.new
  end
  
  def create
    @admin_user = User.new(params[:user])
    if @admin_user.save
      flash[:notice] = 'user created.'
      redirect_to(:controller=>'access', :action => 'login')
    else
      render("new")
    end
  end

  def edit
    @admin_user = User.find(params[:id])
  end
  
  def update
    @admin_user = User.find(params[:id])
    if @admin_user.update_attributes(params[:user])
      flash[:notice] = 'user updated.'
      redirect_to(:controller=>'access', :action => 'menu')
    else
      render("edit")
    end
  end

  def delete
    @admin_user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "user destroyed."
    redirect_to(:controller=>'access', :action => 'menu')
  end
end
