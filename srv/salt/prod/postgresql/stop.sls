postgresql stop:
  service.dead:
    - name: postgresql-11
    - enable: False
