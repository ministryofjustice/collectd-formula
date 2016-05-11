collectd formula
================

v2.0.1

* Always upgrade redis plugin
* Always upgrade elasticsearch plugin

v2.0.0

* Rename the elasticsearch plugin to avoid conflict

1.1.3

* set default for python.Interactive

1.1.2

* Removed 2 offending lines which break the plugin
* Cleaned up code
* Fixed README
* Updated README
* Set the `ValuesPercentage` to true for the `df` plugin   - This will generate the `df.<fs>.percent_bytes` metrics in addition to the `df.<fs>.df_complex` metric   - The advantage is that we have the % of free disk space (or used) and we don't need to calculate it
* Add write reimann plugin

1.1.1

* Add documentation on how to add a new plugin
* Add the elasticsearch plugin to the documentation
* Add LogTraces default for python module

1.1.0

Feature release:
* Add elasticsearch, ntpd and redis to available modules

0.0.6 (2014-08-18)

- Created collectd formula

0.0.5 (2014-07-28)

- Fixed broken link to Salt Formula documentation


0.0.4 (2014-02-26)

- Add CHANGELOG.rst


0.0.3 (2014-02-17)

- Add map.jinja
- Use map.jinja content in init.sls


0.0.2 (2014-02-16)

- Better README extension changed from .md to .rst
- Add link to Salt Formula documentation


0.0.1 (2013-11-03)

- Initial version
