/etc/yum.repos.d/php-webtatic.repo:
  file.managed:
    - source: salt://init/files/php-webtatic.repo
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - defaults:
      ENABLED: 0
      GPGCHECK: 0
