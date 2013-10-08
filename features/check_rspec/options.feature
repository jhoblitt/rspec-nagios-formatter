Feature: command line options
  In order to modifiy the behavior of check_rspec
  As an Icinga administrator
  I want to be able to set command line options

Scenario: run a passing rspec test
  Given a file named "trivial_spec.rb" with:
    """
    describe do
      it { true.should == true }
    end
    """
  When I successfully run `check_rspec trivial_spec.rb`
  Then the stdout should contain:
    """
    RSPEC OK
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
  And the stdout should contain:
    """
    RSPEC Critical
    """

Scenario: run a test with --timeout
  Given a file named "trivial_spec.rb" with:
    """
    describe do
      it { true.should == true }
    end
    """
  When I successfully run `check_rspec --timeout 1 trivial_spec.rb`
  Then the stdout should contain:
    """
    RSPEC OK
    """

Scenario: run a test with --timeout that times out
  Given a file named "trivial_spec.rb" with:
    """
    describe do
      it { sleep(1) }
    end
    """
  When I run `check_rspec --timeout 0.5 trivial_spec.rb`
  Then the exit status should be 2
  And the stdout should contain:
    """
    RSPEC Critical - timeout after 0.5 seconds
    """

Scenario: view usage with -h
  When I successfully run `check_rspec -h`
  And the stdout should contain:
    """
    Usage: check_rspec [options] [--] [passed to rspec]

    Specific options:
        -t, --timeout TIMEOUT            default: 30.0 (seconds)
        -h, --help                       Show this message
    """

Scenario: view usage with --help
  When I successfully run `check_rspec --help`
  And the stdout should contain:
    """
    Usage: check_rspec [options] [--] [passed to rspec]

    Specific options:
        -t, --timeout TIMEOUT            default: 30.0 (seconds)
        -h, --help                       Show this message
    """

Scenario: pass options to rspec
  Given a file named "trivial_spec.rb" with:
    """
    describe 'foo' do
      it { true.should == true }
    end
    describe 'bar' do
      it { true.should == true }
    end
    """
  When I successfully run `check_rspec -- -e 'foo' trivial_spec.rb`
  Then the stdout should contain:
    """
    RSPEC OK - 1 example
    """
