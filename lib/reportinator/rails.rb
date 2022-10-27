require "reportinator/rails/version"
require "reportinator/rails/engine"
require "active_support"

module Reportinator
  module Rails
    include ActiveSupport::Configurable
    config_accessor :tailwind_content, :tailwind_plugins, :input_types
  
    self.tailwind_content = [
      "#{Reportinator::Rails::Engine.root}/app/views/**/*.*",
      "#{Reportinator::Rails::Engine.root}/app/components/**/*.*",
      "#{Reportinator::Rails::Engine.root}/app/helpers/**/*.*",
      "#{Reportinator::Rails::Engine.root}/app/assets/javascripts/**/*.js",
      "#{Reportinator::Rails::Engine.root}/app/**/application.tailwind.css"
    ]

    self.tailwind_plugins = %w[@tailwindcss/forms @tailwindcss/aspect-ratio @tailwindcss/typography]

    self.input_types = [
      "Reportinator::Rails::DateInput",
      "Reportinator::Rails::NumberInput",
      "Reportinator::Rails::StringInput"
    ]
    # Your code goes here...
  end
end
