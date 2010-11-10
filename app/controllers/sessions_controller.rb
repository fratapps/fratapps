class SessionsController < ApplicationController
  def new
  end
  
  def create
  	user = User.authenticate(params[:session][:email], params[:session][:password])
  	
  	if user.nil?
  		flash.now[:failure] = "Email or password is incorrect"
  		render 'new'
  	else
  		sign_in user
  		if current_user.admin?
  			redirect_back_or dashboard_admin_path
  		else
  			redirect_back_or dashboard_user_path
  		end
  	end
  		
  end
  
  def destroy
  	sign_out
  	redirect_to root_path
  end

end
