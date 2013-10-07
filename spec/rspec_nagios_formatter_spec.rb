require 'spec_helper'

describe RSpec::Nagios::Formatter do
  let(:output) { StringIO.new }
  let(:formatter) { RSpec::Nagios::Formatter.new(output) }

  describe "#summary_line" do
    context 'status OK' do
      it do
        expect(formatter.summary_line(42,0,0,0)).to eq(
          "RSPEC OK - 0 examples, 0 failures, finished in 42.0 seconds" +
          " | examples=0 passing=0 failures=0 pending=0 conformance=0% time=42.0s"
        )
      end

      it do
        expect(formatter.summary_line(42,1,0,0)).to eq(
          "RSPEC OK - 1 example, 0 failures, finished in 42.0 seconds" +
          " | examples=1 passing=1 failures=0 pending=0 conformance=100% time=42.0s"
        )
      end

      it do
        expect(formatter.summary_line(42,2,0,1)).to eq(
          "RSPEC OK - 2 examples, 0 failures, 1 pending, finished in 42.0 seconds" +
          " | examples=2 passing=2 failures=0 pending=1 conformance=100% time=42.0s"
        )
      end
    end

    context 'status Critical' do
      it do
        expect(formatter.summary_line(42,1,1,0)).to eq(
          "RSPEC Critical - 1 example, 1 failure, finished in 42.0 seconds" +
          " | examples=1 passing=0 failures=1 pending=0 conformance=0% time=42.0s"
        )
      end

      it do
        expect(formatter.summary_line(42,2,1,1)).to eq(
          "RSPEC Critical - 2 examples, 1 failure, 1 pending, finished in 42.0 seconds" +
          " | examples=2 passing=1 failures=1 pending=1 conformance=50% time=42.0s"
        )
      end

      it do
        expect(formatter.summary_line(42,6,2,2)).to eq(
          "RSPEC Critical - 6 examples, 2 failures, 2 pending, finished in 42.0 seconds" +
          " | examples=6 passing=4 failures=2 pending=2 conformance=67% time=42.0s"
        )
      end
    end
  end
end
