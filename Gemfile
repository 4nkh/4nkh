source "https://rubygems.org"

ruby "3.2.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.2"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use sqlite3 as the database for Active Record
gem "sqlite3", "~> 1.4"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'
#gem 'mimemagic', github: 'mimemagicrb/mimemagic', ref: '3543363026121ee28d98dfce4cb6366980c055ee'
#gem 'mimemagic', '~> 0.4.3'
gem 'pg'
gem 'mysql2'
#gem 'mongrel2'
gem 'thinking-sphinx'
gem 'paperclip', '~> 4.2' 
gem 'will_paginate', '~> 4.0'
gem 'thin', '~> 1.8.0'
gem 'authlogic'
gem "acts-as-taggable-on", '10.0.0'
      #gem 'acts-as-taggable-on', :git => 'git@github.com:4nkh/acts-as-taggable-on.git', :branch => 'master' #'~> 2.2.2', :require => false
#gem 'acts-as-taggable-on', :git => "git://github.com/kuldarkrabbi/acts-as-taggable-on.git"
gem 'twitter_oauth'
gem 'haml'
gem 'rmagick'#, :require => 'RMagick' #, '~> 5.3' #, :require => 'RMagick' #, '~> 5.3'
gem 'dynamic_form'
#gem "facebox-rails", "~> 0.1.1"
gem 'rails_autolink'
gem 'rails-ujs'


#config.gem "mime-types", :lib => "mime/types"
#config.gem "paperclip"#migration/seed, :version => '2.3.1.1'
#config.gem "acts_as_state_machine"  
#config.gem 'ryanb-acts-as-list', :lib => 'acts_as_list', :source => 'http://gems.github.com'  
#config.gem 'rmagick'
#config.gem "acts-as-taggable-on", :source => "http://gemcutter.org", :version => '2.0.0.rc1'
#config.gem 'thinking-sphinx', :version => '1.3.20', :lib => 'thinking_sphinx'
# Gems used only for assets and not required
# in production environments by default.
#gem 'devise'
gem 'bcrypt', '~> 3.1.7'
group :assets do
  gem 'sass-rails',   '~> 6.0.0'
  gem 'coffee-rails', '~> 5.0.0'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

gem "rspec-rails", ">= 2.8.1", :group => [:development, :test]
group :test do
  
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  # Pretty printed test output
  gem 'turn', '~> 0.8.3', :require => false
  gem "machinist"
  gem "factory_girl_rails", ">= 1.6.0"
  gem "cucumber-rails", ">= 1.2.1"
  gem "database_cleaner", ">= 0.7.1"
  gem "launchy", ">= 2.0.5"
end
