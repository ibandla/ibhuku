
class User < ActiveRecord::Base

  has_many :cart_items
  has_many :orders
  has_many :ebook_orders, :through => :orders
  has_many :ebooks, :through => :ebook_orders
  belongs_to :title
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
   devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable,
          :confirmable, :secure_validatable
          # ,:lockable
          # commented out:
          # :omniauthable
  
  include DeviseTokenAuth::Concerns::User
          
  def active_for_authentication?   
      super && !self.blocked && !self.resblock
  end

  

  crypt_keeper   :provider,   :uid,   :reset_password_token, :sign_in_count, 
   :current_sign_in_ip,   :last_sign_in_ip,   :confirmation_token,   
   :unconfirmed_email,   :fullname,   :email,  
   :encryptor => :mysql_aes_new, 
   :key => Rails.application.secrets.secret_database_key, 
   salt: Rails.application.secrets.secret_key_base
  
 
  
end