/etc/httpd/conf.d/wordpress.conf:
  file.managed:
    - source: salt://wordpress/httpd-wordpress.conf.template
    - user: root
    - group: root
    - mode: 644
#https://www.nginx.com/resources/wiki/start/topics/recipes/wordpress/

/etc/wordpress/wp-config.php:
  file.managed:
    - source: salt://wordpress/wp-config.php.template
    - user: root
    - group: apache
    - mode: 640

/etc/wordpress:
  file.directory:
    - user: root
    - group: apache
    - dir_mode: 750
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode
