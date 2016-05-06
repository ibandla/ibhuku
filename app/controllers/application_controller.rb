class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  # protect_from_forgery with: :null_session
  
  protect_from_forgery with: :exception,if: Proc.new { |c| c.request.format != 'application/json' }
  protect_from_forgery with: :null_session,if: Proc.new { |c| c.request.format == 'application/json' }

  
  
  # rescue_from ActiveRecord::RecordNotFound, :with=> :record_not_found
  # rescue_from NameError, :with=> :error_occurred
  # rescue_from ActiveRecord::ActiveRecordError, :with => :error_occurred
  # rescue_from ActionController::RoutingError, :with=> :error_occurred

  
  protected
	def record_not_found(exception)
	  render json: {error: exception.message}.to_json, status: 404
	  return
	end

	def error_occurred(exception)
	  render json: {error: exception.message}.to_json, status: 500
	  return
	end

	def invalid_record(exception)
	  render json: {error: "Invalid Record, Action Could not Continue"}.to_json, status: 420
	  return
	end

end
