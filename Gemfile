source 'https://rubygems.org'
gem "recaptcha", require: "recaptcha/rails", :github => 'ibandla/recaptcha'
gem 'ngannotate-rails'
gem 'ionicons-rails'
gem 'angular_rails_csrf'
gem 'puma'
gem 'cloudinary'
gem 'clean_pagination'
gem 'rack-throttle'
gem 'sprockets-image_compressor'
gem 'sprockets'
gem 'dotenv-rails', :groups => [:development, :test]
gem "bower-rails", "~> 0.10.0"
gem "figaro"
# gem 'rails-assets-angular', '= 1.3.9'
# gem 'spree_digital', github: 'halo/spree_digital', branch: '3-0-stable'
gem 'stripe'

source 'https://rails-assets.org' do
gem 'rails-assets-angular'
# spree_branch = '3-1-stable'

# gem 'spree_core',        github: 'spree/spree',             branch: spree_branch
# gem 'spree_api',         github: 'spree/spree',             branch: spree_branch
# gem 'spree_backend',     github: 'spree/spree',             branch: spree_branch
# gem 'spree_sample',      github: 'spree/spree',             branch: spree_branch
# gem 'spree_gateway',     github: 'spree/spree_gateway',     branch: spree_branch
# gem 'spree_auth_devise', github: 'spree/spree_auth_devise', branch: spree_branch
# gem 'sprangular',        github: 'sprangular/sprangular'
end
group :development do
    gem 'capistrano',         require: false
    gem 'capistrano-rvm',     require: false
    gem 'capistrano-rails',   require: false
    gem 'capistrano-bundler', require: false
    gem 'capistrano3-puma',   require: false
end
gem 'composite_primary_keys', '>= 8.0.0', '< 9.0.0'
group :development, :test do
  gem 'rspec-rails'
end
group :test do
  gem 'shoulda-matchers'
  gem 'rspec-activemodel-mocks'
  gem 'rspec-its'
end
gem 'angularjs-rails-resource', '~> 2.0.0'
gem 'activeadmin_addons'
gem 'devise','~> 3.2'
gem 'font-awesome-rails'
gem 'activeadmin','~>1.0.0.pre2'
gem 'face_of_active_admin'
gem 'bootstrap-sass'
gem 'devise_token_auth'
gem 'omniauth'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~>4.2.6'
# Use mysql as the database for Active Record
gem 'mysql2'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'carrierwave', '~> 0.9'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc


# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.11'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
