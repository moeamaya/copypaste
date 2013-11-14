source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '3.2.13'


gem 'nokogiri'
gem 'newrelic_rpm'
gem 'normalize-rails'
gem 'hirb'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  #gem "less", "~> 2.3.2"
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development do
	gem 'sqlite3'
	gem 'better_errors'
	gem 'binding_of_caller'
end

group :production do
  gem 'pg'
  gem 'unicorn'
end

