class CreateExecutes < ActiveRecord::Migration
  def change
    create_table :executes do |t|

      t.timestamps null: false
    end
  end
end
