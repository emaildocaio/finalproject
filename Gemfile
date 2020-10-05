source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Make turbolinks work with render
gem 'turbolinks_render'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Search gem
gem 'pg_search', '~> 2.3.0'
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

#Carousel Praias
gem 'owlcarousel-rails'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

gem 'autoprefixer-rails'
gem 'font-awesome-sass'
gem 'simple_form'

# Faker ge for seed file
gem 'faker'

# Deals with money in cents
gem 'money-rails'

# deals with payment
gem 'stripe'
gem 'stripe_event'

# Cloudinary
gem 'cloudinary', '~> 1.16.0'

# Chartkick
gem "chartkick"
gem 'groupdate'

## Gemfile for Rails 3+, Sinatra, and Merb
gem 'will_paginate', '~> 3.1.0'

# PDF Generation
gem 'wicked_pdf'

group :production do
  gem 'wkhtmltopdf-heroku'
end

group :development, :test do

  gem 'wkhtmltopdf-binary'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'dotenv-rails'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Bullet for logging n + 1 queries
  gem 'bullet'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Dotenv for hiding secret keys
gem 'dotenv-rails', groups: [:development, :test]

# Devise
gem 'devise'

# Pundit
gem 'pundit'

#geocode
gem 'geocoder'

# cocoon for nested forms
gem "cocoon"

# para visualizar banco de dados
gem 'rails-erd', group: :development
