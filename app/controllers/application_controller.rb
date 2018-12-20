class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  def current_user
   @cached_user = @cached_user || User.find_by(id:session[:user_id])
  end

 def logged_in?
   current_user != nil
  end
end
