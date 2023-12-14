

source 'https://rubygems.org'

ruby '2.6.6'
gem 'rails', '4.2.10'

# for Heroku deployment 
group :development, :test do
  # gem 'mysql2', '~> 0.4.0'
  gem 'sqlite3_ar_regexp', '~> 2.2'
  gem 'sqlite3', '1.3.11'
  gem 'byebug'
  gem 'database_cleaner', '1.4.1'
  gem 'capybara', '2.4.4'
  gem 'launchy'
  gem 'rspec-rails', '3.7.2'
  gem 'ZenTest', '4.11.2'
  gem 'coffee-rails', '~> 4.1.0'
  gem 'turbolinks'
  gem 'bcrypt', '~> 3.1.7'
  gem 'will_paginate', '~> 4.0'
  gem 'will_paginate-bootstrap4'
end

group :test do
  gem 'cucumber-rails', :require => false
  gem 'cucumber-rails-training-wheels'
  gem 'simplecov', :require => false
  gem 'timecop'
end
group :production do
  gem 'pg', '~>0.21'
end

# Gems used only for assets and not required
# in production environments by default.

gem 'sass-rails', '~> 5.0.3'
gem 'uglifier', '>= 2.7.1'
gem 'jquery-rails'
