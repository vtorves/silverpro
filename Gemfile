source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails',    '4.0.0'
gem 'mail',     '2.5.3'

gem 'protected_attributes', '~> 1.0.3' # When upgrade to strong_parameters, remove this gem.
gem 'rails-observers', '~> 0.1.2'
gem 'activerecord-session_store', '~> 0.0.1'

gem 'sidekiq',  '~> 2.13.0'
gem 'sinatra', '~> 1.4.3', require: false # required by sidekiq web interface mounted on /sidekiq

# Turns every field on a editable one
gem 'best_in_place', github: 'bernat/best_in_place', branch: 'rails-4'

# State machine for attributes on models
gem 'state_machine', require: 'state_machine/core'

# paranoid stuff
gem 'paper_trail', '~> 3.0.0.beta1'

# Database and data related
gem 'pg'
gem 'postgres-copy'
gem 'pg_search'

gem 'schema_plus'
gem 'schema_associations'
gem 'chartkick', '1.1.0'

# Payment engines
gem 'catarse_credit_card_net', path: 'lib/gems/catarse_credit_card_net'
gem 'catarse_echeck_net', path: 'lib/gems/catarse_echeck_net'
gem 'catarse_paypal_express', git: 'git://github.com/luminopolis/catarse_paypal_express', ref: '9180b3b'
gem "authorize-net", "~> 1.5.2"

# Decorators
gem 'draper'

# Frontend stuff
gem 'slim-rails', '~> 1.1.1'
gem 'jquery-rails', '~> 3.0.4'
gem 'browser'

# Authentication and Authorization
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-google-oauth2'
gem 'omniauth-linkedin'
gem 'omniauth-facebook', '1.4.0'
gem 'devise', '~> 3.0.2'
gem 'ezcrypto'

# See https://github.com/ryanb/cancan/tree/2.0 for help about this
# In resume: this version of cancan allow checking for authorization on specific fields on the model
gem 'cancan', github: 'ryanb/cancan', branch: '2.0', ref: 'f1cebde51a87be149b4970a3287826bb63c0ac0b'

# Email marketing
gem 'catarse_mailchimp', git: 'git://github.com/catarse/catarse_mailchimp', ref: '2ed4f39'

# HTML manipulation and formatting
gem 'formtastic',   '~> 2.2.1' # WILL BE REMOVED
gem 'simple_form', '~> 3.0.0'
gem 'auto_html', github: 'dejan/auto_html'
gem 'kaminari'

# Uploads
gem 'carrierwave', '~> 0.8.0'
gem 'rmagick'

# Other Tools
gem 'has_permalink'
gem 'ranked-model'
gem 'feedzirra'
gem 'inherited_resources',        '~> 1.4.1'
gem 'has_scope', '~> 0.6.0.rc'
gem 'spectator-validates_email',  require: 'validates_email'
gem 'video_info', '>= 1.1.1'
gem 'enumerate_it'
gem 'httparty', '~> 0.6.1' # this version is required by moip gem, otherwise payment confirmation will break
gem 'pludoni-simple_captcha', require: 'simple_captcha', github: 'pludoni/simple-captcha', branch: 'rails-4'
gem 'geocoder'

# Payment
gem 'moip', github: 'catarse/moip-ruby'
gem 'httpclient',     '>= 2.2.5'

group :production do
  gem 'google-analytics-rails'

  # Gem used to handle image uploading
  gem 'fog', '>= 1.3.1'

  # Workers, forks and all that jazz
  gem 'unicorn'

  # Enabling Gzip on Heroku
  # If you don't use Heroku, please comment the line below.
  gem 'heroku-deflater', '>= 0.4.1'

  # Make heroku serve static assets and loggin with stdout
  #gem 'rails_on_heroku'
  gem 'rails_12factor'

  # Monitoring with the new new relic
  gem 'newrelic_rpm', '3.6.5.130'

  # Using dalli and memcachier have not presented significative performance gains
  # Probably this is due to our pattern of cache usage
  # + the lack of concurrent procs in our deploy
  #gem 'memcachier'
  #gem 'dalli'
end
group :development do
  gem "letter_opener"
  gem 'foreman'
  gem 'better_errors'
  gem 'binding_of_caller'
  # Uncomment only for optimization, should be commented on master branch
  # gem 'rack-mini-profiler'
end

group :test, :development do
  gem 'rspec-rails', '~> 2.14.0'
  gem 'jasmine-rails', '~> 0.4.6'
  gem 'pry'
end

group :test do
  gem 'poltergeist'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'shoulda'
  gem 'factory_girl_rails'
  gem 'capybara',   '~> 2.1.0'
  gem 'coveralls', require: false
  gem 'selenium-webdriver', '~> 2.35.1'
end

gem 'sass-rails', '~> 4.0.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'compass-rails', '~> 2.0.alpha.0'
gem 'uglifier'
gem 'font-awesome-rails'
gem 'font-icons-rails', github: 'shorelabs/font-icons-rails'
gem 'zurb-foundation'
gem 'turbolinks'
gem 'pjax_rails'
gem 'initjs', github: 'josemarluedke/initjs', ref: '005a08717c14e870ad8ed7282e01c914803a3591'

# FIXME: Not-anymore-on-development
# Gems that are with 1 or more years on the vacuum
gem 'weekdays'
gem "rack-timeout"

# TODO: Take a look on dependencies. Why not auto_html?
gem 'rails_autolink', '~> 1.1.0'
