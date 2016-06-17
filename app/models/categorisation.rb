class Categorisation < ActiveRecord::Base
  belongs_to :ebook
  belongs_to :category
end
