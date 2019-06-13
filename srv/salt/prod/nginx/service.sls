include:
  - nginx.install

/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://nginx/nginx.conf.template
    - user: nginx
    - group: nginx
    - mode: 644

nginx-service:
  service.running:
    - name: nginx
    - enable: True
    - reload: True
    - watch:
      - file: /etc/nginx/nginx.conf
      #- file: nginx-service
