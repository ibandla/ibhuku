class RemoveItemColumns < ActiveRecord::Migration
  def change
  	remove_column :ebook_orders, :items
  	remove_column :orders, :items
  end
end
