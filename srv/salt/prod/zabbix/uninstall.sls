non-supported uninstall:
  pkg.removed:
    - names:
      - fping
      - iksemel
      - iksemel-devel
      - iksemel-utils

zabbix40-server uninstall:
  pkg.removed:
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

