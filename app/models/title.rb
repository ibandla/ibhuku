class Title < ActiveRecord::Base
	
	crypt_keeper :name, :encryptor => :mysql_aes_new,
	:key => Rails.application.secrets.secret_database_key,
	salt: Rails.application.secrets.secret_key_base       
		  
	validates :name,presence: true
	has_many :users
end
