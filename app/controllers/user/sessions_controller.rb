class User::SessionsController < DeviseTokenAuth::SessionsController
  def render_create_error_not_confirmed
    if current_user.blocked?
      render json: {
        success: false,
        errors: [ "hahaha" ]
      }, status: 401
    else
      super
    end
  end
end