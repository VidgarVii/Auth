ENV['APP_ENV'] ||= 'development'

require 'sinatra/contrib'

Rake.add_rakelib('rakelib/**')

require 'seedbank'
require 'pathname'

Seedbank.load_tasks if defined?(Seedbank)
