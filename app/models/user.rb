
class User < ActiveRecord::Base
  include DeviseTokenAuth::Concerns::User

  has_many :cart_items
  has_many :orders
  belongs_to :title
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
   devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable
          # ,:lockable
          # commented out:
          # :omniauthable
  
  def active_for_authentication?   
      super && !self.blocked
  end

  def inactive_message
   'Your account has been disabled.'
  end
  
end