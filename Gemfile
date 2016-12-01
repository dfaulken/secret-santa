source 'https://rubygems.org'

gem 'coffee-rails'
gem 'devise'
gem 'haml'
gem 'haml-rails'
gem 'mysql2'
gem 'puma'
gem 'rails', '~> 5.0'
gem 'sass-rails'
gem 'snappconfig'
gem 'uglifier'

source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap'
end

group :assets do
  gem 'twitter-bootstrap-rails'
end

group :development do
  gem 'capistrano', require: false
  gem 'capistrano-pending', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rvm', require: false
  gem 'capistrano3-puma', require: false
  gem 'listen'
end

group :development, :test do
  gem 'better_errors', require: false
  gem 'binding_of_caller', require: false
  gem 'pry-byebug'
end
