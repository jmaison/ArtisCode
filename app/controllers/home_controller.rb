class HomeController < ApplicationController
  def login
	if request.post?
		@user = User.authenticate(params[:email], params[:password])
		if @user
			session[:user_id] = @user.id
			redirect_to :controller => :tags, :action => :index
		else
			flash.now[:notice] = "Invalid email/password combination"
		end			
	end
  end

  def logout
	session[:user_id] = nil
	flash[:notice] = "Logged out"
	redirect_to :action => :login
  end

  def index

  end

end
