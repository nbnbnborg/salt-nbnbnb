include:
  - httpd.conf

httpd service:
  service.running:
    - name: httpd
    - enable: True
    - reload: True
    - require:
      - file: /etc/httpd/conf/httpd.conf
      - file: /etc/httpd/conf/
      - file: /etc/httpd/conf.d/
      - file: /etc/httpd/conf.modules.d/
    - watch:
      - file: /etc/httpd/conf/httpd.conf
      - file: /etc/httpd/conf/
      - file: /etc/httpd/conf.d/
      - file: /etc/httpd/conf.modules.d/
