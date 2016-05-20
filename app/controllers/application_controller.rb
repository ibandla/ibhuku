class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  # protect_from_forgery with: :null_session
  
  protect_from_forgery with: :exception,if: Proc.new { |c| c.request.format != 'application/json' }
  protect_from_forgery with: :null_session,if: Proc.new { |c| c.request.format == 'application/json' }
  # before_filter :banned?

  # def banned?
  #   if current_user.present? && current_user.banned?
  #     sign_out current_user
  #     flash[:error] = "This account has been suspended...."
  #     root_path
  #   end
  # end
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up)        << [:name,:title_id]
  	end

end
