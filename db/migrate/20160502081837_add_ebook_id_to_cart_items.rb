class AddEbookIdToCartItems < ActiveRecord::Migration
  def change
    add_column :cart_items, :ebook_id, :int
    add_index :cart_items, :ebook_id
  end
end
