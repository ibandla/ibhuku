class User::ConfirmationsController < DeviseTokenAuth::ConfirmationsController
   
  def show
   
    super
    @resource.confirmation_token = ""    
    @resource.save
   
   end
  
end