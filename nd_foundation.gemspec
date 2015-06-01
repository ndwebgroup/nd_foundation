$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "nd/foundation/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "nd_foundation"
  s.version     = Nd::Foundation::VERSION
  s.authors     = ["Alec Hipshear", "Erik Runyon"]
  s.email       = ["ahipshea@nd.edu", "erunyon@nd.edu"]
  s.homepage    = "http://github.com/ndwebgroup/nd_foundation"
  s.summary     = "ND Foundation is a custom Foundation theme for Notre Dame University"
  s.description = "We are starting to use Foundation for internal web projects at Notre Dame, and having a gem that we can install to bring in foundation and our minimal modifications is handy"
  s.license     = "APACHE2"

  s.files = Dir["{app,config,db,lib,vendor}/**/*", "LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.2.18"
  s.add_dependency "foundation-rails", '~>5.4.3.0'
  s.add_dependency "sass-rails", '~> 5.0.0'
end
