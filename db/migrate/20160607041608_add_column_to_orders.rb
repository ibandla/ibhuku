class AddColumnToOrders < ActiveRecord::Migration
  def change
      add_column :orders ,:total, :decimal, null: false
   end
end
