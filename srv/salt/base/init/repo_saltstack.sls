/etc/yum.repos.d/saltstack.repo:
  file.managed:
    - source: salt://init/files/saltstack.repo
    - user: root
    - group: root
    - mode: 644
