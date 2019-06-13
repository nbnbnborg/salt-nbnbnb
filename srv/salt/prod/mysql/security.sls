include:
  - mysql.rpm-install
  - mysql.service

#MySQL-python:
#  pkg.installed

## mysql secure installation
{% set MYSQL_ROOT_PASSWORD = "<PPe1fG,d.18" %}
mysqld_secure:
  file.managed:
    - name: /usr/bin/mysql_secure.sh
    - source: salt://mysql/mysql_secure.sh
    - user: root
    - group: root
    - mode: 700
    - require:
      - pkg: "mysql-install"
  cmd.wait:
    - name: /usr/bin/mysql_secure.sh "{{ MYSQL_ROOT_PASSWORD }}"
    - require:
      - service: "mysql service"
    - watch:
      - file: mysqld_secure

/etc/salt/minion.d/mysql-minion.conf:
  file.managed:
    - name: /etc/salt/minion.d/mysql-minion.conf
    - template: jinja
    - source: salt://mysql/mysql-minion.conf.template
    - user: root
    - group: root
    - mode: 640
    - default:
      PASSWORD: {{ MYSQL_ROOT_PASSWORD }}

restart_minion_for_mysql:
  service.running:
    - name: salt-minion
    - watch:
      - file: "/etc/salt/minion.d/mysql-minion.conf"
