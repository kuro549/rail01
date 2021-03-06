require_relative 'boot'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TutorialApp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.i18n.default_locale = :ja
    
    config.generators do |g|
      g.test_framework :rspec,
        fixtures: true,
        routing_specs: false
      g.fixture_replacement :factory_girl, dir: "spec/factories"
    end
    
    config.action_view.embed_authenticity_token_in_remote_forms = true
  end
end
