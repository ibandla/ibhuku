class AdminUser < ActiveRecord::Base
  attr_accessor :gauth_token
 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
  :recoverable, :rememberable, :trackable, 
  :password_expirable, :secure_validatable,
  :password_archivable, :session_limitable,
  :google_authenticatable  

  enum role: [:admin, :manager]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :manager
  end
  
  
  crypt_keeper :email, :reset_password_token, :current_sign_in_ip,
   :last_sign_in_ip,:unique_session_id, :gauth_secret, :gauth_enabled,
   :gauth_tmp, :sign_in_count, :encryptor => :mysql_aes_new,
   :key => Rails.application.secrets.secret_database_key, salt: Rails.application.secrets.secret_key_base             
         
end
