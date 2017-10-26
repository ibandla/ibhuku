class Order < ActiveRecord::Base

    crypt_keeper :total, :encryptor => :mysql_aes_new,
	:key => Rails.application.secrets.secret_database_key,
	salt: Rails.application.secrets.secret_key_base     
    
    belongs_to :user
    has_many :ebook_orders
    has_many :ebooks , through: :ebook_orders
    accepts_nested_attributes_for :ebook_orders
    serialize :items ,Array
end
