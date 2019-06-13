include:
  - php.install
  # PS:remember run php.yum-replace-php at first once!
  - php.conf

php-fpm service:
  service.running:
    - name: php-fpm
    - enable: True
    - reload: True
    - require:
      - file: /etc/php-fpm.conf
      - file: /etc/php-fpm.d/www.conf
      - file: /etc/php.ini
      - file: /etc/php-fpm.d
      - file: /etc/php.d
      - file: /etc/php-zts.d
    - watch:
      - file: /etc/php-fpm.conf
      - file: /etc/php-fpm.d/www.conf
      - file: /etc/php.ini
      - file: /etc/php-fpm.d
      - file: /etc/php.d
      - file: /etc/php-zts.d
