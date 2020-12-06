$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "enju_ir/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "enju_ir"
  spec.version     = EnjuIr::VERSION
  spec.authors     = ["Kosuke Tanabe"]
  spec.email       = ["nabeta@fastmail.fm"]
  spec.homepage    = "https://github.com/next-l/enju_ir"
  spec.summary     = "Next-L Institutiona Repository module"
  spec.description = "Next-L Institutiona Repository module"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 5.2.4", ">= 5.2.4.4"
  spec.add_dependency "attr_json"
  spec.add_dependency "jquery-rails"
  spec.add_dependency "cocoon"
  spec.add_dependency "kaminari"
  spec.add_dependency "statesman"
  spec.add_dependency "faraday"
  spec.add_dependency "builder"
  spec.add_dependency "pundit"
  spec.add_dependency "paper_trail"

  spec.add_development_dependency "pg"
  spec.add_development_dependency "devise"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "factory_bot_rails"
  spec.add_development_dependency "capybara"
  spec.add_development_dependency "puma"
  spec.add_development_dependency "selenium-webdriver"
  spec.add_development_dependency "webdrivers"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "sassc-rails"
  spec.add_development_dependency "annotate"
  spec.add_development_dependency "cucumber-rails"
  spec.add_development_dependency "sunspot_solr"
  spec.add_development_dependency "resque"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "vcr"
end
