{% from "collectd/map.jinja" import collectd_settings with context %}

include:
  - collectd
  - collectd.python

collectd-iostat-module:
  pip.installed:
  - name: https://github.com/deniszh/collectd-iostat-python.git
  - require_in:
    - service: collectd
  - watch_in:
    - service: collectd

{{ collectd_settings.plugindirconfig }}/iostat.conf:
  file.managed:
    - source: salt://collectd/files/iostat.conf
    - user: {{ collectd_settings.user }}
    - group: {{ collectd_settings.group }}
    - mode: 644
    - template: jinja
    - watch_in:
      - service: collectd-service
