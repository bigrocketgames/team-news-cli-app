# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'team_news/version'

Gem::Specification.new do |spec|
  spec.name          = "team_news"
  spec.version       = TeamNews::VERSION
  spec.authors       = ["NATHAN ROBBERT"]
  spec.email         = ["admin@bigrocketgames.com"]

  spec.summary       = "A tool to scrape the page of your selected team in the NFL or NCAA football."
  spec.description   = "This gem is for scraping the selected team page and returning the 20 most recent stories published to the site.  A story can then be read if it is a free article or gives the brief intro to a subscriber only article, if it is available."
  spec.homepage      = "https://github.com/bigrocketgames/team-news-cli-app"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"
end
