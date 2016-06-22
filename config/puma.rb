unless ENV['RAILS_ENV'] == 'production'
 require 'localtunnel'
	begin
		
	 Localtunnel::Client.start(
	  port: 3000,
	  subdomain: 'ibhuku'
	)
	 puts Localtunnel::Client.url
	rescue Exception => e
		puts "Unable to create public url"
	end
end