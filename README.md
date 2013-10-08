Ruby rspec-nagios-formatter Gem
===============================

[![Build Status](https://travis-ci.org/jhoblitt/rspec-nagios-formatter.png)](https://travis-ci.org/jhoblitt/rspec-nagios-formatter)


Description
-----------

This `gem` provides a simple [RSpec](http://rspec.info/) [custom formatter](https://www.relishapp.com/rspec/rspec-core/docs/formatters/custom-formatters) that reports `rspec` results in the Nagios/Icigna [plugin](http://docs.icinga.org/latest/en/pluginapi.html#outputspec) output format.

Install
-------

### via rubygems

    gem install rspec-nagios-formatter

### from git repo

    bundle install
    bundle exec rake install


Usage
-----

    rspec -f RSpec::Nagios::Formatter

See the documentation on [rspec --format](https://www.relishapp.com/rspec/rspec-core/v/2-6/docs/command-line/format-option)
for more information.


Demo
----

Demonstration of running this gem's `rspec` tests with it's own formatter
(after it's been installed).

### Default RSpec formatter

    $ bundle exec rspec
    .......

    Finished in 0.00268 seconds
    7 examples, 0 failures

### Formatted with RSpec::Nagios::Formatter

    $  bundle exec rspec -f RSpec::Nagios::Formatter
    RSPEC OK - 7 examples, 0 failures, finished in 0.00244 seconds | examples=7 passing=7 failures=0 pending=0 conformance=100% time=0.00244s


Support
-------

Please log tickets and issues at [github](https://github.com/jhoblitt/rspec-nagios-formatter)

See Also
--------

* [cucumber-nagios](http://auxesis.github.io/cucumber-nagios/)
* [RSpec](https://github.com/rspec/rspec)
* [Icinga Plugins](http://docs.icinga.org/latest/en/plugins.html)
