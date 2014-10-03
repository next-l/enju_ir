$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "enju_ir/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "enju_ir"
  s.version     = EnjuIr::VERSION
  s.authors     = ["Kosuke Tanabe"]
  s.email       = ["nabeta@fastmail.fm"]
  s.homepage    = "https://github.com/nabeta/enju_ir"
  s.summary     = "Next-L Enju IR"
  s.description = "Next-L Enju Institutional Repository module"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.6"
  s.add_dependency "active-fedora", "~> 7.1"
  s.add_dependency "elasticsearch-model"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 3.1"
end
