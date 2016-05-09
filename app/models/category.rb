class Category < ActiveRecord::Base
  has_many :ebooks, :dependent => :restrict_with_error
end

