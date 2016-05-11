class User < ActiveRecord::Base

  has_many :cart_items
  has_many :orders
  belongs_to :title
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
   devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable,:lockable
          # commented out:
          # :omniauthable
  include DeviseTokenAuth::Concerns::User
    def account_active?
      blocked_at.nil?
    end
    def active_for_authentication?
      super && account_active?
    end
    def inactive_message
      account_active? ? super : :locked
    end
end