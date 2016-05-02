class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|

      t.timestamps null: false
    end
  end
end
