 class Api::TokenController < Api::ApiController
 	
 	 respond_to :json 	 
    	
     def index       
     	ses = Digest::SHA1.hexdigest([Time.now, rand*rand].join)
     	time = Time.now.to_i
     	key = ["session_id":ses,"ts_ms":time]
     	render json:[session], status: 200
     end

     require "openssl"
	 require "base64"

	 KEY = "WxK36qSPHUWxXitbzTO8574D73V13RgZ5d0E7Bl"
	 ALGORITHM = "AES-128-ECB"

	 def encrypt(msg)
		begin
			cipher = OpenSSL::Cipher.new(ALGORITHM)
			cipher.encrypt()
			cipher.key = KEY
			crypt = cipher.update(msg) + cipher.final()
			crypt_string = (Base64.encode64(crypt))
		return crypt_string
			rescue Exception => exc
			puts ("Message for the encryption log file for message #{msg} = #{exc.message}")
		end
	end

	def decrypt(msg)
		begin
			cipher = OpenSSL::Cipher.new(ALGORITHM)
			cipher.decrypt()
			cipher.key = KEY
			tempkey = Base64.decode64(msg)
			crypt = cipher.update(tempkey)
			crypt << cipher.final()
		return crypt
			rescue Exception => exc
			puts ("Message for the decryption log file for message #{msg} = #{exc.message}")
		end
	end
    

end