
require './config/environment'
 fi_check_migration
begin
 
 use Rack::MethodOverride

  run ApplicationController
 
rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end
