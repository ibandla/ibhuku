class Ebook < ActiveRecord::Base
  mount_uploader :pdf, PdfUploader
  validates :title, presence: true
  # attr_accessor :title, :price, :description, :pdf, :author
end
