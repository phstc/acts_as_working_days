#gem build acts_as_working_days.gemspec
#gem push acts_as_working_days-0.0.1.gem

require 'rake/gempackagetask'

PKG_FILES = FileList[
  '[a-zA-Z]*',
  'generators/**/*',
  'lib/**/*',
  'rails/**/*',
  'tasks/**/*',
  'test/**/*'
]
 
spec = Gem::Specification.new do |s|
  s.name = "acts_as_working_days"
  s.version = "0.0.1"
  s.author = "Pablo Cantero"
  s.email = "pablo@pablocantero.com"
  s.homepage = "http://pablocantero.com/"
  s.platform = Gem::Platform::RUBY
  s.summary = "acts_as_working_days is a Rails plugin to add working days on models"
  s.files = PKG_FILES.to_a
  s.require_path = "lib"
  s.has_rdoc = false
  s.extra_rdoc_files = ["README.rdoc"]
end
 
#desc 'Turn this plugin into a gem.'
#Rake::GemPackageTask.new(spec) do |pkg|
#  pkg.gem_spec = spec
#end