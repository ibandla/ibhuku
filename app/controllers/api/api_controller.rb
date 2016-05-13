class Api::ApiController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken

   rescue_from ActiveRecord::RecordNotFound, :with=> :record_not_found
   rescue_from NameError, :with=> :error_occurred
   rescue_from ActiveRecord::ActiveRecordError, :with => :error_occurred
   rescue_from ActionController::RoutingError, :with=> :error_occurred

  
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