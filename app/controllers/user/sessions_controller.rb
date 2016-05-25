class User::SessionsController < DeviseTokenAuth::SessionsController
  protected
  def render_create_error_not_confirmed
    if current_user.blocked?
      render json: {
        success: false,
        errors: [ "You have either been banned." ]
      }, status: 401
    elsif current_user.resblock?
      render json: {
        success: false,
        errors: [ "You did not complete the password reset procedure please restart the process." ]
      }, status: 401
    else
      super
    end
  end 
end