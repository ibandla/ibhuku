class User::SessionsController < DeviseTokenAuth::SessionsController
  
  def create
    # Check
    field = (resource_params.keys.map(&:to_sym) & resource_class.authentication_keys).first

    @resource = nil
    if field
      q_value = resource_params[field]

      if resource_class.case_insensitive_keys.include?(field)
        q_value.downcase!
      end

      q = "#{field.to_s}"

      logger.debug q

      if ActiveRecord::Base.connection.adapter_name.downcase.starts_with? 'mysql'
        q = "BINARY " + q
      end

      @resource = User.search_by_plaintext(:email,q_value).first
      # logger.debug User.tokens
      
      # @resource = resource_class.where(q, q_value).first
    end

    if @resource && valid_params?(field, q_value) && (!@resource.respond_to?(:active_for_authentication?) || @resource.active_for_authentication?)
      valid_password = @resource.valid_password?(resource_params[:password])
      if (@resource.respond_to?(:valid_for_authentication?) && !@resource.valid_for_authentication? { valid_password }) || !valid_password
        render_create_error_bad_credentials
        return
      end
      # create client id
      @client_id = SecureRandom.urlsafe_base64(nil, false)
      @token     = SecureRandom.urlsafe_base64(nil, false)

      @resource.tokens[@client_id] = {
        token: BCrypt::Password.create(@token),
        expiry: (Time.now + DeviseTokenAuth.token_lifespan).to_i
      }
      @resource.save

      sign_in(:user, @resource, store: false, bypass: false)

      yield @resource if block_given?

      render_create_success
    elsif @resource && !(!@resource.respond_to?(:active_for_authentication?) || @resource.active_for_authentication?)
      render_create_error_not_confirmed
    else
      render_create_error_bad_credentials
    end
  end

  
  def valid_password?(model,password)
    Devise::Encryptor.compare(self.class, model.password, password)
  end
  
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