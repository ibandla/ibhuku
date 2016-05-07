class AddForeignKeyToCartItems < ActiveRecord::Migration
  def change
  	add_foreign_key :cart_items, :ebooks
    add_foreign_key :cart_items, :users
  end
end
