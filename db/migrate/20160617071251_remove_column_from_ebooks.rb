class RemoveColumnFromEbooks < ActiveRecord::Migration
  def change
    remove_column :ebooks, :category_id
  end
end
