source 'https://rubygems.org'

gem 'rails',        '~> 5.1.6'
gem 'rails-i18n' # 勤怠8章おまけこのgemを追加しています。
gem 'bcrypt' # 勤怠4章今回追加するgemです
gem 'faker' # 勤怠8章この行を追加してください
gem 'bootstrap-sass'
gem 'will_paginate' # 勤怠8.4.2この行を追加してください。
gem 'bootstrap-will_paginate' # 勤怠8.4.2この行を追加してください。
gem 'rounding' #勤怠を15分単位表示
gem 'puma',         '~> 3.7'
gem 'sass-rails',   '~> 5.0'
gem 'uglifier',     '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks',   '~> 5'
gem 'jbuilder',     '~> 2.5'

group :development, :test do
  gem 'sqlite3', '1.3.13'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg', '0.20.0'
end

# Windows環境ではtzinfo-dataというgemを含める必要があります
# Mac環境でもこのままでOKです
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]