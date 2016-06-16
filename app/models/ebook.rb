class Ebook < ActiveRecord::Base

  # belongs_to :category
  # has_many :categorisations, :foreign_key => :ebook_id
  belongs_to :category
  # , through: :categorisations
  # belongs_to :order
  has_many :ebook_orders
  has_many :orders, through: :ebook_orders ,:foreign_key =>"ebook_id"
  # has_one :
  
  has_many :cart_items, :foreign_key => "ebook_id"
  mount_uploader :pdf, PdfUploader
  mount_uploader :ebook_image, ImageUploader
  validates :title,:ISBN,:category, presence: true
  # attr_accessor :title, :price, :description, :pdf, :author
end
