require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ankh
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version./Users/mathieub/sites/blog/app/assets/images/twit.gif
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  
  
  
    config.plugins = [ :all ]

    config.autoload_paths += Dir["#{config.root}/app/models/**/"]
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password, :confirm_password]

    # Enable the asset pipeline
    config.assets.enabled = true
    #config.assets.precompile += %w( files )
    config.generators do |g|
      g.template_engine :haml
    end
    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'
    
    #config.eager_load = false
    Rails.autoloaders.main.ignore(Rails.root.join('lib/*'))
  end
end
