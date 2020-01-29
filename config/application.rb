require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module PortalSolarDevTest
  class Application < Rails::Application
    config.load_defaults "6.0"
    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
  end
end
