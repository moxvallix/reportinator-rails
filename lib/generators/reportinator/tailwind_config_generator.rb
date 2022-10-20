# Tailwind Generator credit to SpinaCMS: https://github.com/SpinaCMS/Spina/blob/main/lib/generators/spina/tailwind_config_generator.rb

module Reportinator
  class TailwindConfigGenerator < ::Rails::Generators::Base
    source_root File.expand_path("../templates", __FILE__)
    
    def create_tailwind_config_file
      template 'app/assets/config/reportinator/rails/tailwind.config.js'
    end
    
  end
end