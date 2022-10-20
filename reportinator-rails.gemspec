require_relative "lib/reportinator/rails/version"

Gem::Specification.new do |spec|
  spec.name        = "reportinator-rails"
  spec.version     = Reportinator::Rails::VERSION
  spec.authors     = ["Moxvallix"]
  spec.email       = ["dev@moxvallix.com"]
  spec.homepage    = "https://github.com/moxvallix/reportinator-rails"
  spec.summary     = "Rails engine for the Reportinator Gem"
  spec.description = "Rails engine for the Reportinator Gem"
  spec.license     = "MIT"
  
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/moxvallix/reportinator-rails"
  spec.metadata["changelog_uri"] = "https://github.com/moxvallix/reportinator-rails/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.3.1"
  spec.add_dependency "reportinator"
  spec.add_dependency 'tailwindcss-rails'
end
