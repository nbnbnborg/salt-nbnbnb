#include:
#  - mysql.service

saltstack mysql require MySQL-python:
  pkg.installed:
    - name: MySQL-python

wordpress database create:
  mysql_database.present:
    - name: wordpress
    - character_set: utf8
#other conf file maybe is mistake to set 'utf-8'

wordpress user create:
  mysql_user.present:
    - name: wordpress
    - host: localhost
    - password: "O_hRjx+<6a@ob]|'"

wordpress user grant create:
  mysql_grants.present:
    - grant: all privileges
    - database: wordpress.*
    - user: wordpress

