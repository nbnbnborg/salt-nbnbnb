mysql stop:
  service.dead:
    - name: mysqld
    - enable: False
