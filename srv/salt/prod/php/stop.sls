php-fpm stop:
  service.dead:
    - name: php-fpm
    - enable: False
