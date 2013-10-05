require 'spec_helper'
require 'rspec/core/formatters/base_text_formatter'

describe RSpec::Nagios::Formatter do
  let(:output) { StringIO.new }
  let(:formatter) { RSpec::Nagios::Formatter.new(output) }

  describe "#summary_line" do
    it "with 0s outputs pluralized (excluding pending)" do
      expect(formatter.summary_line(0,0,0)).to eq("0 examples, 0 failures")
    end

    it "with 1s outputs singular (including pending)" do
      expect(formatter.summary_line(1,1,1)).to eq("1 example, 1 failure, 1 pending")
    end

    it "with 2s outputs pluralized (including pending)" do
      expect(formatter.summary_line(2,2,2)).to eq("2 examples, 2 failures, 2 pending")
    end
  end
end
