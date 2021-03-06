class ApplicationController < ActionController::Base
  before_action :require_user
  helper_method :current_user, :logged_in?


    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def require_user
        if !logged_in?
            flash[:alert] = "You need to log in to perform that action"
            redirect_to login_path
        end
    end

end
