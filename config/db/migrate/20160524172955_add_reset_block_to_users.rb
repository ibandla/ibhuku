class AddResetBlockToUsers < ActiveRecord::Migration
  def change
  add_column :users ,:resblock, :boolean, null: false, default: false
  end
end
