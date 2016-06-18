class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
    	t.belongs_to :ebook
    	t.belongs_to :user

      t.timestamps null: false
    end
  end
end
