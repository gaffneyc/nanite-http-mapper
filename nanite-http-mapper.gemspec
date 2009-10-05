# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{nanite-http-mapper}
  s.version = "0.9.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Chris Gaffney", "Jason Roelofs"]
  s.date = %q{2009-10-05}
  s.default_executable = %q{nanite-http-mapper}
  s.description = %q{Basic thin + rack service for a long running nanite mapper that receives work requests via http}
  s.email = ["cgaffney@crayoninterface.com", "jroelofs@crayoninterface.com"]
  s.executables = ["nanite-http-mapper"]
  s.extra_rdoc_files = ["README.rdoc", "LICENSE"]
  s.files = ["LICENSE", "README.rdoc", "lib/nanite", "lib/nanite/rack_mapper.rb", "examples/amqp.yml", "examples/worker.rb", "bin/nanite-http-mapper"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Basic thin + rack service for a long running nanite mapper that receives work requests via http}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rack>, [">= 0"])
      s.add_runtime_dependency(%q<thin>, [">= 0"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
      s.add_runtime_dependency(%q<nanite>, [">= 0"])
    else
      s.add_dependency(%q<rack>, [">= 0"])
      s.add_dependency(%q<thin>, [">= 0"])
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<nanite>, [">= 0"])
    end
  else
    s.add_dependency(%q<rack>, [">= 0"])
    s.add_dependency(%q<thin>, [">= 0"])
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<nanite>, [">= 0"])
  end
end
