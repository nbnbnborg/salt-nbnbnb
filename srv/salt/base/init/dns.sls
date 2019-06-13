/etc/resolv.conf:
  file.managed:
    - source: salt://init/files/resolv.conf
    - user: root
    - gourp: root
    - mode: 644

/etc/hosts:
  file.managed:
    - source: salt://init/files/hosts
    - user: root
    - gourp: root
    - mode: 644