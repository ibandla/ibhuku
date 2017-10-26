class AdminUser < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  enum role: [:admin, :manager]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :manager
  end
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, 
         :secure_validatable, :password_expirable, 
         :password_archivable, :session_limitable
         
end
