class User::PasswordsController < DeviseTokenAuth::PasswordsController




 def edit
   super do # TODO there is minor bug too - block does not pass resource        
     # TODO build url correctly when it already has some params (I did not need it in my case)
     params[:redirect_url] += "?reset_password_token=#{@resource.reset_password_token}"
   	 @resource.resblock = true
   	 @resource.save
   end
 end

 def create
  unless resource_params[:email]
    return render_create_error_missing_email
  end

  # give redirect value from params priority
  @redirect_url = params[:redirect_url]

  # fall back to default value if provided
  @redirect_url ||= DeviseTokenAuth.default_password_reset_url

  unless @redirect_url
    return render_create_error_missing_redirect_url
  end

  # if whitelist is set, validate redirect_url against whitelist
  if DeviseTokenAuth.redirect_whitelist
    unless DeviseTokenAuth::Url.whitelisted?(@redirect_url)
      return render_create_error_not_allowed_redirect_url
    end
  end

  # honor devise configuration for case_insensitive_keys
  if resource_class.case_insensitive_keys.include?(:email)
    @email = resource_params[:email].downcase
  else
    @email = resource_params[:email]
  end

  
  @resource = User.search_by_plaintext(:email,@email)

  @errors = nil
  @error_status = 400

  if @resource
    yield @resource if block_given?
    @req = @resource.send_reset_password_instructions({
      email: @email,
      provider: 'email',
      redirect_url: @redirect_url,
      client_config: params[:config_name]
    })


    if @req.errors.empty?
      return render_create_success
    else
      @errors = @req.errors
    end
  else
    @errors = [I18n.t("devise_token_auth.passwords.user_not_found", email: @email)]
    @error_status = 404
  end

  if @errors
    return render_create_error
  end
end


 protected 

 def resource_update_method
 	@resource.resblock = false
    @resource.save
    @resource.allow_password_change = @resource.reset_password_token.present? && resource_params[:reset_password_token] == @resource.reset_password_token
	super
 end

end