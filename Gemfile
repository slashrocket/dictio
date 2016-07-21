source 'https://rubygems.org'

ruby '2.2.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use PostgreSQL as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'clearance'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster.
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'bootstrap', '~> 4.0.0.alpha3'
# Puma for web server. It's the Heroku default, after all ;)
gem 'puma'

# Use Administrate for Admin panel
gem 'administrate', '~> 0.2.2'

# Bourbon needed to make Administrate work...for now
gem 'bourbon'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Need this to test authentication
gem 'factory_girl_rails'

# Add voting capabilities
gem 'thumbs_up'

group :production do
  gem 'rails_12factor'
end

gem 'newrelic_rpm'

gem 'rollbar'
gem 'oj', '~> 2.12.14'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution & get a debug console
  gem 'byebug'
  gem 'minitest-reporters'

end

group :development do
  # Replace web-console with better_errors for, well, better errors
  gem 'better_errors'
  gem 'binding_of_caller'

  # Bullet helps to kill N+1 queries and unused eager loading
  gem 'bullet'

  # Spring speeds up development by keeping your app running in the background.
  gem 'spring'

  # Annotate models with current schema
  gem 'annotate'
end

group :test do
  # Use simplecov for testing coverage
  gem 'simplecov', require: false
end
