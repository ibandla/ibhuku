class CreateEbooksCategoriesJoin < ActiveRecord::Migration
  def change
    create_table :categories_ebooks , :id => false do |t|
      t.integer :category_id
      t.integer :ebook_id
    
    end
  end
end
