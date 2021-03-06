Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
config.action_mailer.default_url_options = { :host => 'localhost:3000' }
  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true

  config.action_mailer.delivery_method = :smtp

  config.web_console.whitelisted_ips = '10.0.2.2','192.168.10.1'

  config.action_mailer.smtp_settings = {
    address:  ENV['SMTP_ADDRESS'],
    port: ENV['SMTP_PORT'],
    authentication: "plain",
    enable_starttls_auto: true,
    user_name: ENV['SMTP_USER'],
    password: ENV['SMTP_PASSWORD']
    }


# # Sets environment to :development
# pesapal = Pesapal::Merchant.new(:development)
# #set order details
# pesapal.order_details = { :amount => 1000,
#                           :description => 'this is the transaction description',
#                           :type => 'MERCHANT',
#                           :reference => '808-707-606',
#                           :first_name => 'Swaleh',
#                           :last_name => 'Mdoe',
#                           :email => 'user@example.com',
#                           :phonenumber => '+254722222222',
#                           :currency => 'KES'
#                         }

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  config.reset_url = "http://localhost:3000/update"

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
  # config.middleware.use Rack::Throttle::Minute,   :max => 60
end
