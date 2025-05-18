source 'https://rubygems.org'

source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap'
end

ruby "3.2.2"

gem 'rails', '8.0.2'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets

gem 'rack-cors'

gem 'ruby-openai', '~> 4.2'

gem 'net-ssh'
gem 'devise'
gem 'rails_12factor', group: :production
gem 'active_model_serializers'

gem 'puma'
gem 'aws-sdk', '~> 3.0'

gem 'figaro'

gem 'pry-byebug'
gem 'pusher'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 4.2'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end