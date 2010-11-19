require 'acts_as_working_days'

#TODO Não é vendor/plugins/yaffle/lib/yaffle.rb: - Conforme o Guia
%w{ models }.each do |dir|
  path = File.join(File.dirname(__FILE__), 'app', dir)
  $LOAD_PATH << path
  ActiveSupport::Dependencies.load_paths << path
  ActiveSupport::Dependencies.load_once_paths.delete(path)
end