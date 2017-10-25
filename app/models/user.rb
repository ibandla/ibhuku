
class User < ActiveRecord::Base
  include DeviseTokenAuth::Concerns::User

  has_many :cart_items
  has_many :orders
  has_many :ebook_orders, :through => :orders
  has_many :ebooks, :through => :ebook_orders
  belongs_to :title

  enum role: [:user, :admin, :product_manager]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
   devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable,
          :confirmable, :secure_validatable
          # ,:lockable
          # commented out:
          # :omniauthable
  
  def active_for_authentication?   
      super && !self.blocked && !self.resblock
  end

  
  
end