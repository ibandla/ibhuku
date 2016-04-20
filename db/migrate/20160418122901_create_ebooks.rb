class CreateEbooks < ActiveRecord::Migration
  def change
    create_table :ebooks do |t|
      t.string :title
      t.string :author
      t.text :description
      t.float :price
      t.string :pdf

      t.timestamps null: false
    end
  end
end
