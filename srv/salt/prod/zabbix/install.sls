include:
  - zabbix.unius

non-supported install:
  pkg.installed:
    - names:
      - fping
      - iksemel
      - iksemel-devel
      - iksemel-utils

zabbix install:
  pkg.installed:
    - names:
      - zabbix-server
      - zabbix-sender
      - zabbix-web
      - zabbix-server-mysql
      - zabbix-web-mysql
      # other require
      - zabbix-agent
      - zabbix-get
      - zabbix-java-gateway
      - zabbix-proxy-mysql
