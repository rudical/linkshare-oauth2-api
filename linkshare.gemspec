$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "linkshare/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "linkshare"
  s.version     = Linkshare::VERSION
  s.authors     = ["Rudie Shahinian"]
  s.email       = ["rudie@devbbq.com"]
  s.homepage    = ""
  s.summary     = "Provides the Linkshare OAuth2 API."
  s.description = "Provides the Linkshare OAuth2 API."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.4"
  s.add_dependency "oauth2"
  s.add_dependency "awesome_print"
end
