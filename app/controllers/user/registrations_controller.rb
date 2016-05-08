class User::RegistrationsController < DeviseTokenAuth::RegistrationsController
  prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.

  private
    def check_captcha
      if verify_recaptcha
        true
      else
        @error = ["Big Error","Blag Blag"]
        render json:@error, status: 401
      end 
    end
end