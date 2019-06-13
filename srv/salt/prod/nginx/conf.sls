include:
  - nginx.install

/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://nginx/nginx.conf.template
    - user: nginx
    - group: nginx
    - mode: 644
    - require:
      - pkg: "nginx install"

/etc/nginx/conf.d/:
  file.directory:
    - user: nginx
    - group: nginx
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode
