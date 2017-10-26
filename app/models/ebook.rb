class Ebook < ActiveRecord::Base
  belongs_to :category
  # has_many :categorizations
  # has_many :categories ,through: :categorizations
  
  
  crypt_keeper :ISBN, :price, :description,
  :author, :title, :encryptor => :mysql_aes_new,  
	:key => Rails.application.secrets.secret_database_key,
	salt: Rails.application.secrets.secret_key_base  
  
  has_many :ebook_orders
  has_many :orders, through: :ebook_orders 
  
  has_many :cart_items, :foreign_key => "ebook_id"
  mount_uploader :pdf, PdfUploader
  mount_uploader :ebook_image, ImageUploader
  validates :title,:price,:pdf,:description,:author,:ISBN,:category, presence: true
end
