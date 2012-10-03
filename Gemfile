source 'https://rubygems.org'

ruby '1.9.3'
gem 'rails', '3.2.8'
gem 'jquery-rails'
gem 'paperclip'
gem 'aws-sdk'
gem 'aws-s3'
gem 'will_paginate' 

#Ambientes de Desarrollo y Test
group :development, :test do
  gem 'sqlite3'
  gem 'annotate'
end

#Ambiente de Produccion
group :production do
  gem 'pg'
  gem 'thin'
end

# Gems utilizadas solo por los assets
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'less-rails'
  gem 'twitter-bootstrap-rails'
end
