/etc/zabbix/zabbix_server.conf:
  file.managed:
    - source: salt://zabbix/zabbix_server.conf.template
    - template: jinja
    - user: root
    - group: zabbix
    - mode: 640
    - defaults:
      DBHost: localhost
      DBName: zabbix
      DBUser: zabbix
      # can not add " !
      DBPassword: Jzd,b38@Q.R@/h)\

#/etc/zabbix:
#  file.directory:
#    - user: root
#    - group: root
#    - dir_mode: 755
#    - file_mode: 644
#    - recurse:
#      - user
#      - group
#      - mode

/etc/httpd/conf.d/zabbix.conf:
  file.managed:
    - source: salt://zabbix/httpd-zabbix.conf.template
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - default:
      PHP_TIMEZONE: "Asia/Shanghai"
