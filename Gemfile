source 'https://rubygems.org'



gem 'rails', '4.1.8'           # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'pg'                       # Use postgresql as the database for Active Record
gem 'sass-rails', '~> 4.0.3'   # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0'     # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.0.0' # Use CoffeeScript for .js.coffee assets and views

# gem 'therubyracer',  platforms: :ruby


# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Bootstrap and styling
gem 'bootstrap-sass', '~> 3.3.0'
gem 'font-awesome-sass', '~> 4.2.0'

# templates`
gem 'slim-rails'
gem 'simple_form', '3.1.0.rc2' # Forms
gem 'nested_form'

# HIDE CODES
gem 'dotenv-rails', :groups => [:development, :test]

# API
# Grape API
gem 'grape-active_model_serializers'
gem 'grape', '0.9.0'
gem 'grape-entity'
gem 'rack-contrib', '~> 1.1.0'
gem 'grape-swagger', '~> 0.7.2'
gem 'grape-swagger-rails',  '~> 0.0.8'
gem 'grape-kaminari'

gem "hashie_rails"

# auth
gem 'devise'
gem 'pundit', github: 'DanOlson/pundit'

#Image upload
gem 'carrierwave'

#Image manipulation
gem 'mini_magick'

# States
gem 'state_machine'

# Heroku assets
gem 'rails_12factor'


# Facebook login helper
gem "koala", "~> 1.11.0rc"

# omniauth gem for facebook 
gem 'omniauth-facebook'


group :development do 
  # better error message
  gem "better_errors"
  # debugger built in error page
  gem "binding_of_caller"

  # Performance analysis and debugging
  gem "bullet"

    #debugger
  gem 'pry'
  gem 'pry-remote'
  gem 'pry-nav'
end

group :test do

  # Test Formatting
  gem 'fuubar'
  
  # Test Matchers
  gem 'shoulda-matchers'

  # Integration Testing
  gem 'cucumber'
  gem 'capybara'

  gem 'simplecov', require: false
  gem 'simplecov-rcov', require: false
end


