/etc/httpd/conf/httpd.conf:
  file.managed:
    - source: salt://httpd/httpd.conf.template
    - user: root
    - group: root
    - mode: 644

/etc/httpd/conf/:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode

/etc/httpd/conf.d/:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode

/etc/httpd/conf.modules.d/:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode

