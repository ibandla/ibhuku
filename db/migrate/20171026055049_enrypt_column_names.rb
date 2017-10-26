class EnryptColumnNames < ActiveRecord::Migration
  def change


    #Titles
    change_column :titles, :name, :text  

    #Categories
    change_column :categories, :name, :text  
    
    change_column :categories, :description, :text

    #ebooks      
    change_column :ebooks, :ISBN, :text

    change_column :ebooks, :title, :text

    change_column :ebooks, :author, :text

    change_column :ebooks, :description, :text

    change_column :ebooks, :price, :text
    
    #orders
    change_column :orders, :total, :text
    
    #ebook_orders
    change_column :ebook_orders, :price, :text

    #admin_users
    
    change_column :admin_users, :current_sign_in_ip, :text  
    
    change_column :admin_users, :last_sign_in_ip, :text  
        
    change_column :admin_users, :unique_session_id, :text  
        
    change_column :admin_users, :gauth_secret, :text  
        
    change_column :admin_users, :gauth_enabled, :string  
        
    change_column :admin_users, :gauth_tmp, :text  

    change_column :admin_users, :sign_in_count, :string    

    remove_index :admin_users, :reset_password_token

    change_column :admin_users, :reset_password_token, :text  

    add_index :admin_users, :reset_password_token, unique: true, length: 255  

  end
end
