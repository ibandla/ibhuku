class CartItem < ActiveRecord::Base
	self.primary_keys = :ebook_id, :user_id
	# belongs_to :user
	belongs_to :user, :foreign_key => "user_id"
	belongs_to :ebook, :foreign_key => "ebook_id"
end
