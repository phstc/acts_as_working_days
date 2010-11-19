class ActsAsWorkingDaysMigrationGenerator < Rails::Generator::Base 
  def manifest 
    record do |m| 
      m.migration_template 'migration.rb', 'db/migrate', :migration_file_name => "acts_as_working_days_migration"
    end
  end
end