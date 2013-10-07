require 'rspec_nagios_formatter'
require 'spec_helper'

describe RSpecNagiosFormatter do
  let(:output) { StringIO.new }
  let(:formatter) { RSpecNagiosFormatter.new(output) }

  it 'should be an alias of RSpec::Nagios::Formatter' do
    formatter.should be_kind_of(RSpec::Nagios::Formatter)
  end
end
