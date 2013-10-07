# based on
# https://github.com/sj26/rspec_junit_formatter/tree/e42c5e51e0676ff7a2c967b61db26512afa9ea22/lib
# after encountering strange errors trying to create a formatter outside the
# RSpec::Core::Formatters namespace

#require 'rspec'
require 'rspec/core/formatters/nagios_formatter'

RSpecNagiosFormatter = RSpec::Core::Formatters::NagiosFormatter
