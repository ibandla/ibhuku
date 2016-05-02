class CartItem < ActiveRecord::Base
	self.primary_keys = :user_id, :ebook_id
	belongs_to :users
	belongs_to :ebooks
end
