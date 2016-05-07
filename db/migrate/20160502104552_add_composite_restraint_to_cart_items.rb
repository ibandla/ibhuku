class AddCompositeRestraintToCartItems < ActiveRecord::Migration
  def change
  	add_index :cart_items, ["user_id", "ebook_id"], :unique => true
  end
end
