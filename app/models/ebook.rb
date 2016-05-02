class Ebook < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_many :cart_items

  mount_uploader :pdf, PdfUploader
  validates :title, presence: true
  # attr_accessor :title, :price, :description, :pdf, :author
end
