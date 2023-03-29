require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ProdeLocal
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Set the default locale to Japanese
    config.i18n.default_locale = :ja

    # Load locale files from config/locales directory
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.i18n.available_locales = [:ja, :en] # Enable Japanese and English locales
    config.i18n.default_locale = :ja # Set the default locale to Japanese

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end

module ActionView
  module Helpers
    module DateHelper
      class << self
        def locale_options
          @@locale_options ||= {}
        end
      end
    end
  end
end
