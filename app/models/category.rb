class Category < ActiveRecord::Base
  validates :name, :description,presence: true
  # has_many :categorisations, :foreign_key => :category_ids
  has_many :ebooks
  # ,through: :categorisations, :dependent => :restrict_with_error
  # accepts_nested_attributes_for :categorisations

end

