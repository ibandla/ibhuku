class Api::ApiController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken

   # rescue_from ActiveRecord::RecordNotFound, :with=> :error_occurred
   # rescue_from NameError, :with=> :error_occurred
   # rescue_from ActiveRecord::ActiveRecordError, :with => :error_occurred
   # rescue_from ActionController::RoutingError, :with=> :error_occurred

  
  protected
	def error_occurred(exception)
	  render json: {error: "Not Found"}.to_json, status: 404
	  return
	end 
end