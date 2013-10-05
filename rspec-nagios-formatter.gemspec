$LOAD_PATH.push File.expand_path("../lib", __FILE__)
require "rspec/nagios/formatter_version"

Gem::Specification.new do |s|
  s.name              = "rspec-nagios-formatter"
  s.version           = RSpec::Nagios::Formatter::VERSION
  s.platform          = Gem::Platform::RUBY
  s.authors           = ["Joshua Hoblitt"]
  s.email             = ["jhoblitt@cpan.org"]
  s.homepage          = "https://github.com/jhoblitt/rspec-nagios-formatter"
  s.summary           = %q{A RSpec formatter for the Nagios/Icinga plugin format}
  s.description       = %q{A RSpec formatter for the Nagios/Icinga plugin format}
  s.license           = "Apache 2.0"

  s.add_runtime_dependency("rspec-core", ">= 2.0.0")
  s.add_development_dependency("rake", ">= 10.0.0")

  s.rubygems_version = ">= 1.6.1"
  s.files            = `git ls-files`.split("\n")
  s.test_files       = `git ls-files -- {spec,features}/*`.split("\n")
  s.executables      = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_path     = "lib"
end
