class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  include_all_helpers
  helper_method :current_user_session, :current_user, :admin_rights, :layout
  
# TODO: refactor logic
    def admin_rights
      if current_user
        if current_user.has_role? :admin
          return true
        else
          return false
        end
      else
        return false
      end
    end
  
    def _check_admin_rights
      unless admin_rights
        redirect_to_session_or_default root_url
      end
    end  
  
    def require_user
      unless current_user
        _set_return_location
        flash[:notice] = "Login needed to access this page."
        redirect_to new_user_session_url
        return false
      end
    end
    
    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end

    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end
    
    def _set_return_location
      session[:return_to] = request.url
    end
    
    def redirect_to_session_or_default(default)
      #flash[:notice] = "Return_to: " + session[:return_to]
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
    
    def layout
      if current_user_session
        if admin_rights
          #logger.info "----> application"
          "application"
        else
          #logger.info "----> application_client"
          "application_client"
        end
      else
        "login"
      end
    end
 end
