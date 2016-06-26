class User::RegistrationsController < DeviseTokenAuth::RegistrationsController
  prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.

  private
    def check_captcha
      if verify_recaptcha
        true
      else
        render json: {
        status: 'error',
        errors: {"full_messages":["You have not completed the captcha. Please do so."]}
      }, status: 422
      end 
    end
end