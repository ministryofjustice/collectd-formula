{% from "collectd/map.jinja" import collectd_settings with context %}

include:
  - collectd
  - collectd.python

collectd-elasticsearch-module:
  pip.installed:
  - name: git+https://github.com/ministryofjustice/elasticsearch-collectd-plugin
  - upgrade: True
  - require_in:
    - service: collectd
  - watch_in:
    - service: collectd
  - env_vars:
    LC_ALL: C


{{ collectd_settings.plugindirconfig }}/elasticsearch.conf:
  file.managed:
    - source: salt://collectd/files/elasticsearch.conf
    - user: {{ collectd_settings.user }}
    - group: {{ collectd_settings.group }}
    - mode: 644
    - template: jinja
    - watch_in:
      - service: collectd-service
