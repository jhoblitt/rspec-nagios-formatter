require 'rspec'
require 'rspec/core/formatters/base_formatter'

class RSpec::Core::Formatters::NagiosFormatter < RSpec::Core::Formatters::BaseFormatter
  def initialize(output)
    super(output)
  end

  def dump_summary(duration, example_count, failure_count, pending_count)
    super(duration, example_count, failure_count, pending_count)
    output.puts summary_line(duration, example_count, failure_count, pending_count)
  end

  def summary_line(duration, example_count, failure_count, pending_count)
    passing_count = example_count - failure_count
    # conformance is expressed as a percentage
    # if example_count is zero we need to aviod div by 0
    if example_count > 0
      conformance  = passing_count / example_count.to_f
      conformance *= 100
      #conformance   = "%.2f" % conformance
      conformance  = conformance.round(0)
    else
      conformance  = 0
    end
    # limit duration precision to microseconds
    time          = duration.round(6)

    summary = 'RSPEC'
    if failure_count == 0
      summary << " OK"
    else
      summary << " Critical"
    end
    summary << " - " << pluralize(example_count, "example")
    summary << ", " << pluralize(failure_count, "failure")
    summary << ", #{pending_count} pending" if pending_count > 0
    summary << ", finished in #{time} seconds"

    summary << " | examples=#{example_count}"
    summary << " passing=#{example_count - failure_count}"
    summary << " failures=#{failure_count}"
    summary << " pending=#{pending_count}"
    summary << " conformance=#{conformance}%"
    summary << " time=#{time}s"

    summary
  end
end
