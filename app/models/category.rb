


class Category < ActiveRecord::Base
  validates :name, :description,presence: true
  # has_many :categorisations, :foreign_key => :category_ids
  has_many :ebooks, :dependent => :restrict_with_error

  # has_many :categorisations, :foreign_key => :category_id
  # has_many :categorizations

  # ,through: :categorisations, :dependent => :restrict_with_error
  # accepts_nested_attributes_for :categorisations

end
