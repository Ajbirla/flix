class ApplicationController < ActionController::Base
	  helper_method :current_user
	  helper_method :require_admin
    helper_method :require_sadmin
	def current_user
   		@current_user ||=User.find(session[:user_id]) if session[:user_id]
 	end
 	
 	private
    def require_signin
      unless current_user
      	session[:intended_url]=request.url
        flash[:notice] = "you need to login first"
        redirect_to new_sessions_path
      end
    end

    def require_admin
      unless current_user && current_user.admin?
        flash[:error] = "you are not authorized person"
        redirect_to root_path
      end
    end
    def require_signout
        if current_user
          redirect_to root_path, notice: "you need to singout first"
        end
    end
    def require_sadmin
      unless current_user && current_user.sadmin?
        flash[:error] = "you are not authorized person"
        redirect_to users_path
      end
    end

end
