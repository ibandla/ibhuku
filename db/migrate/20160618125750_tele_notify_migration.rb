class TeleNotifyMigration < ActiveRecord::Migration

  def self.up
    create_table :telegram_users do |t|
      t.integer :telegram_id
      t.string :first_name
      t.string :username

      t.timestamps
    end

    add_index :telegram_users, :telegram_id
  end

  def self.down
    drop_table :telegram_users
  end

end
