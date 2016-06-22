unless ENV['RAILS_ENV'] == 'production'
 require 'localtunnel'

 Localtunnel::Client.start(
  port: 3000,
  subdomain: 'ibhuku'
)
 puts Localtunnel::Client.url
end