source 'https://rubygems.org'

ruby '2.0.0'
gem 'rails', '3.2.13'

gem 'sqlite3'
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'puma'

gem 'haml'
gem 'haml-rails'
gem 'ruby-haml-js'
gem 'haml_coffee_assets'

gem 'mongoid', '~>3.0'

group :test, :development do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'capybara', '1.1.2'
  gem 'launchy'
  gem 'mongoid-rspec'
  gem 'rack_session_access'
  gem 'pry'
  gem 'pry-nav'

  # Pretty printed test output
  gem 'turn', require: false
end
