class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :ebooks, :through => :categorizations
end
