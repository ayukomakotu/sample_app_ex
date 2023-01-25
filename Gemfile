source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'rails',                   '7.0.4.2'
gem 'active_storage_validations'
gem 'image_processing'
gem 'mini_magick'
gem 'bcrypt'
gem 'faker'
gem 'will_paginate'
gem 'bootstrap-will_paginate'
gem 'bootstrap-sass'
gem 'puma'
gem 'sassc-rails'
gem 'importmap-rails'
gem 'stimulus-rails'
# gem 'webpacker', '~> 6.0.0.pre.2'
# gem 'turbolinks'
gem 'turbo-rails'
gem 'jbuilder'            
gem 'bootsnap', require: false
gem 'rexml'
gem 'rss'
gem 'dotenv-rails'

group :development, :test do
  gem 'sqlite3'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'faker'
end

group :development do
  gem 'web-console'
  gem 'listen'
  #gem 'rack-mini-profiler'
  #gem 'spring'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'rails-controller-testing'
  gem 'minitest'
  gem 'minitest-reporters'
  gem 'guard'
  gem 'guard-minitest'
end

group :production do
  gem 'pg'
end

# Windows ではタイムゾーン情報用の tzinfo-data gem を含める必要があります
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]