require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'
# require 'sprockets/railtie'
require 'rails/test_unit/railtie'

Bundler.require(*Rails.groups)

module TwitterScout
  # class for Application configuration
  class Application < Rails::Application
    config.middleware.insert_before 'Rack::Runtime', 'Rack::Cors'
    allow do
      origins '*'
      resource '*',
               headers: :any,
               methods: [:get, :put, :post, :patch, :delete, :options]
    end
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
  end
end
