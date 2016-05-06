class AddUserIdToCartItems < ActiveRecord::Migration
  def change
    add_column :cart_items, :user_id, :int
    add_index :cart_items, :user_id
  end
end
