/etc/yum.repos.d/nginx.repo:
  file.managed:
    - source: salt://init/files/nginx.repo
    - user: root
    - group: root
    - mode: 644