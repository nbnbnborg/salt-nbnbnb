/etc/soft.conf:
  file.managed:
    - source: salt://soft/soft.conf.template
    - user: root
    - group: root
    - mode: 644

/etc/soft.d:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode
