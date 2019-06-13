/etc/yum.repos.d/ius.repo:
  file.managed:
    - source: salt://init/files/ius.repo
    - user: root
    - group: root
    - mode: 644