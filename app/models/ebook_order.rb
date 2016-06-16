class EbookOrder < ActiveRecord::Base
self.primary_keys =  :order_id,:ebook_id
  belongs_to :order , :foreign_key =>"order_id"
  belongs_to :ebook, :foreign_key => "ebook_id"
end
