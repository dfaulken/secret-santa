source 'https://rubygems.org'

gem 'haml'
gem 'haml-rails'
gem 'mysql2'
gem 'rails', '~> 5.0'
gem 'sass-rails'
gem 'snappconfig'

source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap'
  gem 'rails-assets-jquery'
end

group :assets do
  gem 'twitter-bootstrap-rails'
end

group :development do
  gem 'capistrano', require: false
  gem 'capistrano-pending', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-passenger', require: false
  gem 'listen'
end

group :development, :test do
  gem 'better_errors', require: false
  gem 'binding_of_caller', require: false
end
