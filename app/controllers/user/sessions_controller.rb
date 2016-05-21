class User::SessionsController < DeviseTokenAuth::SessionsController
  protected
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
  protected
  def after_sign_in_path_for(resource)
    if resource.is_a?(User) && resource.blocked?
      sign_out resource
      flash[:error] = "This account has been suspended for violation of...."
      root_path
    else
      super
    end
   end
end