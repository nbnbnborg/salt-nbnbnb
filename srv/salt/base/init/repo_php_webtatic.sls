/etc/yum.repos.d/php-webtatic.repo:
  file.managed:
    - source: salt://init/files/php-webtatic.repo
    - user: root
    - group: root
    - mode: 644
