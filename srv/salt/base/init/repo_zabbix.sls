zabbix repo:
  file.managed:
    - name: /etc/yum.repos.d/zabbix.repo
    - source: salt://init/files/zabbix.repo.template
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - default:
      ZABBIX_COBBLER_COMMENT: {{ pillar['zabbix_repo_server']['ZABBIX_COBBLER_COMMENT'] }}
      ZABBIX_ALI_COMMENT: {{ pillar['zabbix_repo_server']['ZABBIX_ALI_COMMENT'] }}
      GPGCHECK: 0
