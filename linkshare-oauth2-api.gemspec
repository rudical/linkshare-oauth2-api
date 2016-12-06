$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "linkshare/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "linkshare-oauth2-api"
  s.version     = Linkshare::VERSION
  s.authors     = ["Rudie Shahinian"]
  s.email       = ["rudie@neovision.ca"]
  s.homepage    = "https://github.com/rudical/linkshare-oauth2-api"
  s.summary     = "Provides Rakutan Linkshare OAuth2 API's."
  s.description = "Provides Rakuten Linkshare OAuth2 API's for Coupons, Link Locator,
                  Products Search, Advanced Reports, Advertiser search, and Events."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 4.2", "< 5.1"
  s.add_dependency "oauth2", "~> 1.0"

  s.add_development_dependency "awesome_print"
end
