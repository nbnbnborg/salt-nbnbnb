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
      - zabbix-web
      - zabbix-server-mysql
      - zabbix-web-mysql
      # other require
      - zabbix-agent
      - zabbix-get
      - zabbix-java-gateway
      - zabbix-proxy-mysql

# --> Processing Conflict: php72u-pdo-7.2.17-1.ius.centos7.x86_64 conflicts php-pdo < 7.2.17-1.ius.centos7
# --> Processing Conflict: php72u-common-7.2.17-1.ius.centos7.x86_64 conflicts php-common < 7.2.17-1.ius.centos7
# --> Finished Dependency Resolution
# Error: php72u-pdo conflicts with php-pdo-5.4.16-46.el7.x86_64
# Error: php72u-common conflicts with php-common-5.4.16-46.el7.x86_64


