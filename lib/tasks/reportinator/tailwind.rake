# Tailwind Rake Task credit to SpinaCMS: https://github.com/SpinaCMS/Spina/blob/main/lib/tasks/tailwind.rake
require 'tailwindcss-rails'

TAILWIND_COMPILE_COMMAND = "#{Tailwindcss::Engine.root.join("exe/tailwindcss")} -i #{Reportinator::Rails::Engine.root.join("app/assets/stylesheets/reportinator/rails/application.tailwind.css")} -o #{Rails.root.join("app/assets/builds", "reportinator/rails/tailwind.css")} -c #{Rails.root.join("app/assets/config/reportinator/rails/tailwind.config.js")}"

namespace :reportinator do
  namespace :tailwind do 
    desc "Build your Tailwind CSS"
    task build: :environment do
      Rails::Generators.invoke("reportinator:tailwind_config", ["--force"])
      system TAILWIND_COMPILE_COMMAND
    end
    
    task watch: :environment do
      Rails::Generators.invoke("reportinator:tailwind_config", ["--force"])
      system "#{TAILWIND_COMPILE_COMMAND} -w"
    end
  end
end

if Rake::Task.task_defined?("assets:precompile")
  Rake::Task["assets:precompile"].enhance(["reportinator:tailwind:build"])
end