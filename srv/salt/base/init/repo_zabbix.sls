zabbix repo:
  file.managed:
    - name: /etc/yum.repos.d/zabbix.repo
    - source: salt://init/files/zabbix.repo.template
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - defaults:
      #ZABBIX_COBBLER_COMMENT: "#" #if use grains['fqdn'],& conf pillar, when jinja render repo_url to be "None",fuck.
      ZABBIX_ALI_COMMENT: "#" #if use grains['fqdn'],& conf pillar, when jinja render repo_url to be "None",fuck.
      GPGCHECK: 0
