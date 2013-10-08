Feature: run rspec tests
  In order to monitor the enviroment
  As an Icinga administrator
  I want to get RSpec test results in Icinga plugin format

Scenario: run a passing rspec test
  Given a file named "trivial_spec.rb" with:
    """
    describe do
      it { true.should == true }
    end
    """
  When I successfully run `check_rspec trivial_spec.rb`
  Then it should pass with regexp:
    """
    ^RSPEC OK - 1 example, 0 failures, finished in 0.\d+ seconds | examples=1 passing=1 failures=0 pending=0 conformance=100% time=0.\d+s$
    """

Scenario: run a failing rspec test
  Given a file named "trivial_spec.rb" with:
    """
    describe do
      it { true.should == false }
    end
    """
  When I run `check_rspec trivial_spec.rb`
  Then the exit status should be 2
  And it should fail with regexp:
    """
    ^RSPEC Critical - 1 example, 1 failures, finished in 0.\d+ seconds | examples=1 passing=0 failures=1 pending=0 conformance=0% time=0.\d+s$
    """
