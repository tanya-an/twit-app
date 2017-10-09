class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  #before_action :require_login
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  private

  #def require_login
  #	cookies.permanent.signed[:remember_token] = [user.id, user.salt]
  #  self.current_user = user
  #end

end

  