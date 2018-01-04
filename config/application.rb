require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Leopard
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Support grape API
    config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb') 
    config.autoload_paths += Dir[Rails.root.join('app')]
  end
end
