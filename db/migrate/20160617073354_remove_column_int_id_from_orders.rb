class RemoveColumnIntIdFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders , :int_id
  end
end
