include:
  - mysql.rpm-install

/etc/my.cnf:
  file.managed:
    - source: salt://mysql/my.cnf.template
    - user: mysql
    - group: mysql
    - mode: 644

mysql service:
  service.running:
    - name: mysqld
    - enable: True
    - reload: True
    - watch:
      - file: /etc/my.cnf
