include:
  - zabbix.conf

zabbix-server service:
  service.running:
    - name: zabbix-server
    - enable: True
    - reload: True
    - require:
      - file: /etc/zabbix/zabbix_server.conf
    - watch:
      - file: /etc/zabbix/zabbix_server.conf

zabbix httpd service:
  service.running:
    - name: httpd    
    - enable: True
    - reload: True
    - require:
      - file: /etc/httpd/conf.d/zabbix.conf
    - watch:
      - file: /etc/httpd/conf.d/zabbix.conf

