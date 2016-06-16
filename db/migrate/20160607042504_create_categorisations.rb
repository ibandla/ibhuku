class CreateCategorisations < ActiveRecord::Migration
  def change
    create_table :categorisations do |t|
      t.belongs_to :ebook, index: true, foreign_key: true
      t.belongs_to :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
