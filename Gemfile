source "https://rubygems.org"

require "json"
require "open-uri"
versions = JSON.parse(open("https://pages.github.com/versions.json").read)

ruby versions["ruby"]

gem "github-pages", versions["github-pages"]
gem "rake", "~> 10.1.1"
gem 'compass'
gem 'sass-media_query_combiner'
gem 'autoprefixer-rails'
gem 'jekyll-press'
