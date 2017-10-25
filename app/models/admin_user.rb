class AdminUser < ActiveRecord::Base
	attr_accessor :gauth_token
 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :google_authenticatable, :database_authenticatable, 
         :recoverable, :rememberable, :trackable, 
         :secure_validatable, :password_expirable, 
         :password_archivable, :session_limitable
         
end
