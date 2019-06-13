zabbix repo:
  file.managed:
    - name: /etc/yum.repos.d/zabbix.repo.template
    - source: salt://init/files/zabbix.repo
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - default:
      GPGCHECK: 0
