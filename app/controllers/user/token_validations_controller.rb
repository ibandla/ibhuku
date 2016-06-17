class User::TokenValidationsController  < DeviseTokenAuth::TokenValidationsController
  

 
   protected

    def render_validate_token_success
    expected_referer = "/update?reset_password_token="+@resource.reset_password_token.to_s
    referer = (request.referer).to_s.include? expected_referer
    cond =  referer || !@resource.resblock 

	    if cond && !@resource.blocked
	    	super
	    else
	    	render_validate_token_error
	    end

    end

end