# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{postie}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ben Schwarz"]
  s.date = %q{2009-05-21}
  s.email = %q{ben.schwarz@gmail.com}
  s.extra_rdoc_files = ["README.md", "LICENSE"]
  s.files = ["README.md", "VERSION.yml", "lib/models", "lib/models/locality.rb", "lib/models/state.rb", "lib/postie.rb", "test/postcode_test.rb", "test/test_helper.rb", "LICENSE"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/benschwarz/postie}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A Sinatra based Rack middleware for Australian postcodes}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sinatra>, [">= 0.9.2"])
      s.add_runtime_dependency(%q<dm-core>, [">= 0"])
      s.add_runtime_dependency(%q<dm-serializer>, [">= 0"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
    else
      s.add_dependency(%q<sinatra>, [">= 0.9.2"])
      s.add_dependency(%q<dm-core>, [">= 0"])
      s.add_dependency(%q<dm-serializer>, [">= 0"])
      s.add_dependency(%q<json>, [">= 0"])
    end
  else
    s.add_dependency(%q<sinatra>, [">= 0.9.2"])
    s.add_dependency(%q<dm-core>, [">= 0"])
    s.add_dependency(%q<dm-serializer>, [">= 0"])
    s.add_dependency(%q<json>, [">= 0"])
  end
end
