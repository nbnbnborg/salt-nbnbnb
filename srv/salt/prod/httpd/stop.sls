httpd stop:
  service.dead:
    - name: httpd
    - enable: False
