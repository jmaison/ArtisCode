class ApplicationController < ActionController::Base
  protect_from_forgery
 
  protected 
	def authorize
		unless User.find_by_id(session[:user_id])
			flash[:notice] = "Please log in"
			redirect_to :controler => :home, :action => :login
		end
	end
end
