#include:
#  - mysql.service

saltstack mysql require MySQL-python:
  pkg.installed:
    - name: MySQL-python

zabbix database create:
  mysql_database.present:
    - name: zabbix
    - character_set: utf8
    - collate: utf8_bin

zabbix user create:
  mysql_user.present:
    - name: zabbix 
    - host: localhost
    - password: Jzd,b38@Q.R@/h)\

zabbix user grant create:
  mysql_grants.present:
    - grant: all privileges
    - database: zabbix.*
    - user: zabbix

zabbbix mysql database create:
  cmd.run:
    - name: zcat `rpm -ql zabbix-server-mysql|grep .sql.gz` | mysql -hlocalhost -uzabbix -p"Jzd,b38@Q.R@/h)\" zabbix
    #- unless:
    - require:
      - mysql_grants: "zabbix user grant create"
