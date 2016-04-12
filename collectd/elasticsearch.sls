{% from "collectd/map.jinja" import collectd_settings with context %}

include:
  - collectd
  - collectd.python

collectd-elasticsearch-plugin:
  git.latest:
    - name: https://github.com/phobos182/collectd-elasticsearch.git
    - target: {{ collectd_settings.moduledirconfig }}/collectd-elasticsearch
    - rev: {{ collectd_settings.plugins.elasticsearch.rev }}
    - force_reset : True
    - force_fetch : True
    - force_clone : True
    - force_checkout : True
    - require_in:
      - service: collectd
    - watch_in:
      - service: collectd

collectd-elasticsearch-plugin-symlink:
  file.symlink:
    - name: {{ collectd_settings.moduledirconfig }}/collectd-elasticsearch.py
    - target: {{ collectd_settings.moduledirconfig }}/collectd-elasticsearch/elasticsearch.py
    - force: True
    - require_in:
      - git: collectd-elasticsearch-plugin

{{ collectd_settings.plugindirconfig }}/elasticsearch.conf:
  file.managed:
    - source: salt://collectd/files/elasticsearch.conf
    - user: {{ collectd_settings.user }}
    - group: {{ collectd_settings.group }}
    - mode: 644
    - template: jinja
    - watch_in:
      - service: collectd-service
