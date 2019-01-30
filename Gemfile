source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'


gem 'rails', '~> 5.2.1', '>= 5.2.1.1'
gem 'sqlite3'
gem 'puma', '~> 3.11'
gem 'jbuilder', '~> 2.5'
gem 'devise'
gem 'devise-jwt', '~> 0.5.8'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'rack-cors'
gem 'rack-attack', '~> 5.4', '>= 5.4.2'

group :development, :test do
	gem 'rspec-rails', '~> 3.8'
 gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
 gem 'factory_bot', '~> 4.11', '>= 4.11.1'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
   gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end



gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
