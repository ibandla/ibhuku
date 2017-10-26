class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  # protect_from_forgery with: :null_session
  protect_from_forgery
  
    
  helper_method :admin?
  
  protected
  
  def admin?
    if current_admin_user.role =="admin"
      return true
    end
  end
  
  def authorize
    unless admin?
      flash[:error] = "Unauthorized Access"
      redirect_to admin_root_url
      false
    end
  end
  protect_from_forgery with: :exception,if: Proc.new { |c| c.request.format != 'application/json' }
  protect_from_forgery with: :null_session,if: Proc.new { |c| c.request.format == 'application/json' }
  
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up)        << [:fullname,:title_id]
  	devise_parameter_sanitizer.for(:account_update) << [:fullname,:title_id]
    end


 
  rescue_from ActionController::RoutingError, with: -> { render_404  }  
  def render_404
     redirect_to "/#/404"
  end

end
