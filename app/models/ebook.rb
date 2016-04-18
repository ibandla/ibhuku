class Ebook < ActiveRecord::Base
  mount_uploader :pdf, PdfUploader
  validates :title, presence: true
end
