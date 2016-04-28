class CreateEbookCatrgoriesJoin < ActiveRecord::Migration
  def change
    create_table :ebook_catrgories, :id => false do |t|
      t.string :category_id
      t.integer :ebook_id
    end
  end
end
