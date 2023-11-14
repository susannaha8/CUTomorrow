class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user

  def current_user
    if session[:student_id]
      @student = Student.find(session[:student_id])
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    redirect_to login_path unless logged_in?
  end

  def op_authorized
    redirect_to schedule_path unless !logged_in?
  end
  
end


#https://hackernoon.com/authentication-and-authorization-with-bcrypt-in-rails-mw1g3u3l