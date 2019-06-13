zabbix-server stop:
  service.dead:
    - name: zabbix-server
    - enable: False

zabbix httpd stop:
  service.dead:
    - name: httpd
    - enable: False

