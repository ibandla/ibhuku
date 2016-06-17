<<<<<<< HEAD:db/migrate/20160607042504_create_categorisations.rb
class CreateCategorisations < ActiveRecord::Migration
  def change
    create_table :categorisations do |t|
      t.belongs_to :ebook, index: true, foreign_key: true
      t.belongs_to :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
=======
class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.belongs_to :category, index: true, foreign_key: true
      t.belongs_to :ebook, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
>>>>>>> refs/remotes/origin/payment:db/migrate/20160617065713_create_categorizations.rb
