class Category < ActiveRecord::Base
  validates :name, :description,presence: true
  has_many :ebooks, :dependent => :restrict_with_error
end

