require 'config'

namespace :db do
  desc 'Run database migration'
  task :migrate, %i[version] => :settings do |t, args|
    require 'sequel/core'
    DB.extension :schema_dumper
    Sequel.extension :migration

    Sequel.connect(Settings.db.to_hash) do |db|
      migrations = File.expand_path('../../db/migrations/', __dir__)
      version    = args&.version.to_i

      Sequel::Migrator.run(db, migrations, target: version)

      File.write(
        File.expand_path('db/schema.rb'),
        DB.dump_schema_migration
      )
    end
  end
end
