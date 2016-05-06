class Ebook < ActiveRecord::Base

  belongs_to :category
  has_many :cart_items
  mount_uploader :pdf, PdfUploader
  mount_uploader :ebook_image, ImageUploader
  validates :title, presence: true
  # attr_accessor :title, :price, :description, :pdf, :author
end
