class HomeController < ApplicationController
  def index
  
    if request.post?
    	user = User.authenticate(params[:email], params[:password])
    	
    	if user
    	
    	else 
    	
    		flash.now[:notice] = "Invalid user name or password"
    	end
    end
  
  
  end

protected

  def set_stylesheets
    @stylesheets = %w{ home }
  end
  
end
