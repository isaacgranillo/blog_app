class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #need to add this line so methods are available in views, by default they are available to all controllers without this line
  helper_method :current_user, :logged_in?
  

  def current_user
  	# @current_user || @current_user =  User.find(session[:user_id]) if session[:user_id]
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
  	# current_user is true
  	!!current_user
  end

  def require_user
  	if !logged_in?
  		flash[:danger] = "You need to be logged in for this"
  		redirect_to root_path
  	end
  end
end
