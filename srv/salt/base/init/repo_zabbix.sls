/etc/yum.repos.d/zabbix.repo:
  file.managed:
    - source: salt://init/files/zabbix.repo
    - user: root
    - group: root
    - mode: 644