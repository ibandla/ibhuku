class CreateEbookOrders < ActiveRecord::Migration
  def change
    create_table :ebook_orders do |t|
      t.belongs_to :order, index: true, foreign_key: true
      t.belongs_to :ebook, index: true, foreign_key: true
      t.decimal :price

      t.timestamps null: false
    end
  end
end
