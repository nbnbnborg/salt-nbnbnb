php-uninstall:
  pkg.removed:
    - names:
      - php72u-cli
      - php72u-pdo
      - php72u-mysqlnd
      - php72u-fpm
      #- php72u-fpm-nginx
      - php72u-opcache
      - php72u-gd
      - php72u-imap
      - php72u-mbstring
      - php72u-process
      - php72u-xml      
      - php72u-xmlrpc
      - php72u-json 
      #- php72u-zip 
      - php72u-pspell 
      - php72u-pecl-apcu 
      - php72u-pecl-memcached 
      - php72u-ioncube-loader

yum replace php72u-common --replace-with php-common -y:
  cmd.run:
    - unless: test $[rpm -q php72u-common] = 1

include:
  - ius.yum-replace-uninstall

