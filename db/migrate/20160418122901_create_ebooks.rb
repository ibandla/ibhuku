class CreateEbooks < ActiveRecord::Migration
  def change
    create_table :ebooks do |t|
      t.belongs_to :category, :int, index: true
      t.string :ebook_id
      t.string :title
      t.string :author
      t.text :description
      t.float :price
      t.string :pdf
      t.string :ebook_image

      t.timestamps null: false
    end
  end
end
