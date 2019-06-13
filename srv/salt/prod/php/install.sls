include:
  - ius.yum-replace-install
#  - php.yum-replace-php #this sls,please run it once at first use hand

php-install:
  pkg.installed:
    - names:
      - php72u-common
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
      #- php72u-zip yum repo has no this pkg.

      - php72u-pspell
      - php72u-pecl-apcu
      - php72u-pecl-memcached
      - php72u-ioncube-loader

      # nginx & httpd require
      - php72u-fpm-nginx
      - php72u-fpm-httpd

      - php72u-pecl-imagick-devel
      - php72u-pecl-imagick

      # db extension
      - php72u-pecl-redis
      - php72u-pecl-mongodb
    #- fromrepo: "ius" etc....., so can not to only ius.
    - require:
      - pkg: "yum-plugin-replace install"
#      - cmd: "yum replace php-common --replace-with php72u-common -y"
