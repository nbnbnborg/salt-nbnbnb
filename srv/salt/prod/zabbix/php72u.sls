php72u uninstall:
  pkg.removed:
    - names:
      #- php72u-pdo
      #- php72u-common

      - php72u-xml
      - php72u-ldap
      - php72u-bcmath
      - php72u-mbstring
      - mod_php72u
      - php72u-pdo
      - php72u-pgsql
      - php72u-gd
      - php72u-common

php54 install:
  pkg.installed:
    - names:
      - php-common
      - php-pdo
