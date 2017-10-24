class AddPasswordExpirytoAdmin < ActiveRecord::Migration
  def change
    add_column :admin_users ,:password_changed_at, :datetime
    add_index :admin_users, :password_changed_at   
  end
end
