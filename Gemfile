source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

gem'bcrypt-ruby','3.1.2'

# Use Postgres as the database for Active Record
gem 'pg'

# Use typhoeus for http request 
gem 'typhoeus'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do

	# suppresses assets messages in console
	gem 'quiet_assets'

	# 
	gem 'better_errors'

	# adds console access in browser, at point of error
	gem 'binding_of_caller'

	# adds support for Chrome extension
	gem 'meta_request'

	# adds pry console debugging
	gem 'pry'

	# adds better formatting / printing of objects/variables
	gem 'awesome_print'

	# adds show model, and some object navigation (and some other stuff)
	gem 'pry-rails'

	# adds better breakpoint features, and more (see)
	gem 'pry-byebug'
end

# for heroku install
gem 'rails_12factor', group: :production

# gem to pull secret token and apikeys from .env file / ENV
gem 'dotenv-rails', :groups => [:development, :test]

ruby "2.0.0"

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
