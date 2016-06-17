class AddForeignKeyToUsers < ActiveRecord::Migration
  def change
  	add_foreign_key :users, :titles
  end
end
