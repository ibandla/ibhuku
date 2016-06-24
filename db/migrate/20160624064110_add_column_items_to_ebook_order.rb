class AddColumnItemsToEbookOrder < ActiveRecord::Migration
  def change
    add_column :ebook_orders, :items, :text
  end
end
