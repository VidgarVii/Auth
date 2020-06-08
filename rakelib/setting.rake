task :settings do
  require 'config'
  require 'sequel'
  require_relative '../config/initializers/config'
  require_relative '../config/initializers/sequel'
end
