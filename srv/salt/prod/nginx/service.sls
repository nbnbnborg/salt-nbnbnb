include:
  - nginx.install
  - nginx.conf

nginx service:
  service.running:
    - name: nginx
    - enable: True
    - reload: True
    - watch:
      - file: "/etc/nginx/nginx.conf"
      - file: "/etc/nginx/conf.d/"
