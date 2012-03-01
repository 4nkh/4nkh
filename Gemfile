source 'http://rubygems.org'

gem 'rails', '3.1.3'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'mysql2'
#gem 'mongrel2'
gem 'thinking-sphinx'
gem 'paperclip'
gem 'will_paginate'
gem 'thin'
gem 'authlogic'
#gem "acts-as-taggable-on", '2.0.6'
gem 'acts-as-taggable-on', :git => 'git@github.com:4nkh/acts-as-taggable-on.git', :branch => 'master' #'~> 2.2.2', :require => false
#gem 'acts-as-taggable-on', :git => "git://github.com/kuldarkrabbi/acts-as-taggable-on.git"
gem 'twitter_oauth'
gem 'haml'
gem 'rmagick', :require => 'RMagick'
gem 'dynamic_form'
gem "facebox-rails", "~> 0.1.1"
gem 'rails_autolink'


#config.gem "mime-types", :lib => "mime/types"
#config.gem "paperclip"#migration/seed, :version => '2.3.1.1'
#config.gem "acts_as_state_machine"  
#config.gem 'ryanb-acts-as-list', :lib => 'acts_as_list', :source => 'http://gems.github.com'  
#config.gem 'rmagick'
#config.gem "acts-as-taggable-on", :source => "http://gemcutter.org", :version => '2.0.0.rc1'
#config.gem 'thinking-sphinx', :version => '1.3.20', :lib => 'thinking_sphinx'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
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
  # Pretty printed test output
  gem 'turn', '~> 0.8.3', :require => false
  gem "machinist"
  gem "factory_girl_rails", ">= 1.6.0"
  gem "cucumber-rails", ">= 1.2.1"
  gem "capybara", ">= 1.1.2"
  gem "database_cleaner", ">= 0.7.1"
  gem "launchy", ">= 2.0.5"
end
