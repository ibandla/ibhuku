class Ebook < ActiveRecord::Base
  has_many :categorizations
  has_many :categories, :through => :categorizations
  mount_uploader :pdf, PdfUploader
  validates :title, presence: true
  # attr_accessor :title, :price, :description, :pdf, :author
end
