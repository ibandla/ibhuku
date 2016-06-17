class Order < ActiveRecord::Base

    belongs_to :user
    has_many :ebook_orders
    has_many :ebooks , through: :ebook_orders
    accepts_nested_attributes_for :ebook_orders

end
