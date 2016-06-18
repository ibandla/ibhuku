class Api::HookController < ActionController::Base
  skip_before_filter :verify_authenticity_token
  include TeleNotify::Controller
end
