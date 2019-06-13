keepalived stop:
  service.dead:
    - name: keepalived
    - enable: False
