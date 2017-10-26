class EbookOrder < ActiveRecord::Base
self.primary_keys =  :order_id,:ebook_id
  belongs_to :order , :foreign_key =>"order_id"
  belongs_to :ebook, :foreign_key => "ebook_id"

  crypt_keeper :price, :encryptor => :mysql_aes_new,
	:key => Rails.application.secrets.secret_database_key,
	salt: Rails.application.secrets.secret_key_base      

end
