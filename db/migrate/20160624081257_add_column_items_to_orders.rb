class AddColumnItemsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :items, :text
  end
end
