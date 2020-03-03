source 'https://rubygems.org'

ruby "2.6.0"

gem 'rails', '~> 5.0.0'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg', '1.2.2'
gem 'foundation-rails'
gem 'jquery-rails', "~> 4.3.0"
gem 'tabulous'
gem 'devise'
gem 'will_paginate'

group :test, :development do 
  gem 'rspec-rails', '~> 3.9'
  gem 'guard-rspec', '4.7.3'
  gem 'guard-minitest'
  gem 'guard-zeus'
  gem 'childprocess', '~> 0.5.1'
end

# Gems used only for assets and not required
# in production environments by default.
gem 'sass-rails',   '~> 5.0.0'
gem 'coffee-rails', '~> 4.2.0'
gem "jquery-datatables-rails", "~> 1.12.2"

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', :platforms => :ruby

gem 'uglifier', '>= 1.0.3'

group :test do
  gem "cucumber-rails", "~> 1.4.0", :require => false
  gem "selenium-webdriver", "~> 2.40.0"
  gem 'database_cleaner-active_record'
  gem 'rails-controller-testing'
  gem "simplecov", "~> 0.18.5", {:require=>false}
end


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

#for Heroku
gem 'rails_12factor', group: :production
