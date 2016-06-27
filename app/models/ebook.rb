class Ebook < ActiveRecord::Base
  belongs_to :category
  # has_many :categorizations
  # has_many :categories ,through: :categorizations
  has_many :ebook_orders
  has_many :orders, through: :ebook_orders 
  
  has_many :cart_items, :foreign_key => "ebook_id"
  mount_uploader :pdf, PdfUploader
  mount_uploader :ebook_image, ImageUploader
  validates :title,:price,:pdf,:description,:author,:ISBN,:category, presence: true
end
