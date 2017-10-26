class EncryptUserModel < ActiveRecord::Migration
  def change
    
    change_column :users, :provider, :string 
    change_column :users, :uid, :string 
    remove_index :users, :reset_password_token
    change_column :users, :reset_password_token, :text   
    add_index :users, :reset_password_token, :unique => true, length: 255
    change_column :users, :sign_in_count, :string       
    change_column :users, :current_sign_in_ip, :text 
    change_column :users, :last_sign_in_ip, :text 
    change_column :users, :confirmation_token, :text     
    change_column :users, :unconfirmed_email, :string 
    change_column :users, :fullname, :text 
    change_column :users, :email, :string 
    
  end
end
