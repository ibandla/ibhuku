class EbookIdUserIdNotNullToCartITems < ActiveRecord::Migration
  def change
  	change_column_null :cart_items, :ebook_id, false
  	change_column_null :cart_items, :user_id, false
  end
end
