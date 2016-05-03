class ApplicationController < ActionController::Base
  # include DeviseTokenAuth::Concerns::SetUserByToken
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  
 #  protect_from_forgery

	# after_filter :set_csrf_cookie_for_ng

	# def set_csrf_cookie_for_ng
 #  		cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
	# end

 #  protect_from_forgery with: :exception,if: Proc.new { |c| c.request.format != 'application/json' }
 #  protect_from_forgery with: :null_session,if: Proc.new { |c| c.request.format == 'application/json' }

 #  protected

 #  # In Rails 4.2 and above
 #  def verified_request?
 #    super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
 #  end
  
 #  rescue_from ActiveRecord::RecordNotFound, :with=> :record_not_found
 #  rescue_from NameError, :with=> :error_occurred
 #  rescue_from ActiveRecord::ActiveRecordError, :with => :error_occurred
 #  rescue_from ActionController::RoutingError, :with=> :error_occurred

  
 #  protected
	# def record_not_found(exception)
	#   render json: {error: exception.message}.to_json, status: 404
	#   return
	# end

	# def error_occurred(exception)
	#   render json: {error: exception.message}.to_json, status: 500
	#   return
	# end

	# def invalid_record(exception)
	#   render json: {error: "Invalid Record, Action Could not Continue"}.to_json, status: 420
	#   return
	# end

	protect_from_forgery with: :null_session

  respond_to :json

  # before_action :configure_permitted_parameters, if: :devise_controller?

  def angular
    render 'layouts/application'
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
  end
end


