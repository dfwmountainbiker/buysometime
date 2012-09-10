source 'http://rubygems.org'

gem 'rails', '3.0.9'
gem 'mysql2', '~> 0.2.6'
gem 'will_paginate', '3.0.pre2'

# Don't want to use devise 2, bc it's too new and may be buggy with Omniauth pre 1.0
gem 'devise', '1.5.3'

# After omniauth 0.3.2, it goes to version 1, which is too new, and has new connector/identity info
gem 'omniauth', '0.3.2'

#for JSON Parsing....bc with Facebook you know you'll have to
gem 'crack'

# Koala is used for Facebook connectivity
gem 'koala'
 
group :development, :test do
  gem 'capybara'
  gem 'rspec-rails'
  #gem 'haml-rails'
  gem 'hpricot'
  gem 'ruby_parser'
  gem 'web-app-theme'
end

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19', :require => 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end
