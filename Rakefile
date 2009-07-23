require 'rubygems' unless ENV['NO_RUBYGEMS']
require 'rake/gempackagetask'
require 'rubygems/specification'
require 'date'

GEM = "nanite-http-mapper"
GEM_VERSION = "0.9.0"

spec = Gem::Specification.new do |s|
  s.name = GEM
  s.version = GEM_VERSION
  s.author = "Chris Gaffney"
  s.email  = "cgaffney@crayoninterface.com"
  #s.homepage = "http://example.com"
  s.description = s.summary = "Basic thin + rack service for a long running nanite mapper that receives work requests via http"
  
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = false
  #s.extra_rdoc_files = ["README", "LICENSE", 'TODO']

  # Configure executables
  s.bindir = "bin"
  s.executables = %w{nanite-http-mapper}
  
  # Uncomment this to add a dependency
  s.add_dependency "rack"
  s.add_dependency "thin"
  s.add_dependency "json"
  s.add_dependency "nanite"
  
  s.require_path = 'lib'
  #s.autorequire = GEM
  s.files = %w{LICENSE README.rdoc} + Dir.glob("{lib,examples,bin}/**/*")
end

task :default => :package
task :clean => :clobber_package

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "install the gem locally"
task :install => [:clean, :package] do
  sh %{sudo gem install pkg/#{GEM}-#{GEM_VERSION}}
end

desc "create a gemspec file"
task :make_spec do
  File.open("#{GEM}.gemspec", "w") do |file|
    file.puts spec.to_ruby
  end
end
