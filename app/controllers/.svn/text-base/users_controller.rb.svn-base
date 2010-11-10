class UsersController < ApplicationController
	before_filter :authenticate, :only => [:edit, :update]
	before_filter :correct_user, :only => [:edit, :update]
	before_filter :admin_user, :only => :destroy

  def index
    @users = User.all
  end


  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end


  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end


  def edit
    #@user = User.find(params[:id])
  end


  def create
    @user = User.new(params[:user])
    @user.set_group params[:user][:group_name]
    if @user.save
    	sign_in @user
   		flash[:success] = "Welcome to FratApps!"
   		if current_user.admin?
   			redirect_to dashboard_admin_path
   		else 
    		redirect_to dashboard_user_path
		end
    else
    	render 'new'
    end
  end


  def update
    @user = User.find(params[:id])
	if @user.update_attributes(params[:user])
		flash[:success] = "Profile updated"
		redirect_to @user
	else
		render 'edit'
	end
	
  end


  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed"
    redirect_to users_path
  end
  
  
  private
  	
  	def correct_user
  		@user = User.find(params[:id])
  		redirect_to(root_path) unless current_user?(@user)
  	end 
  	
  	def admin_user
  		redirect_to(root_path) unless current_user.admin?
  	end
  
end
