class AddColumnToEbooks < ActiveRecord::Migration
  def change
    add_column :ebooks ,:category_id, :integer
  end
end
