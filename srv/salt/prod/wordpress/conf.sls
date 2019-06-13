include:
  - wordpress.install

/etc/httpd/conf.d/wordpress.conf:
  file.managed:
    - source: salt://wordpress/httpd-wordpress.conf.template
    - user: root
    - group: root
    - mode: 644
    - unless: test ${rpm -q httpd24u} = 1 
#https://www.nginx.com/resources/wiki/start/topics/recipes/wordpress/

/etc/nginx/conf.d/wordpress.conf:
  file.managed:
    - source: salt://wordpress/nginx-wordpress.conf.template
    - user: nginx
    - group: nginx
    - mode: 644
    - template: jinja
    - defaults:
      SERVER_NAME: {{ grains['fqdn_ip4'][0] }}
      PORT: 80
    - unless: test ${rpm -q nginx} = 1


/etc/wordpress/wp-config.php:
  file.managed:
    - source: salt://wordpress/wp-config.php.template
    - user: root
    - group: nginx 
    # for nginx&apache can read
    - mode: 644
    - template: jinja
    - defaults:
      DB_NAME: wordpress
      DB_USER: wordpress
      DB_PASSWORD: "O_hRjx+<6a@ob]|'"
      #OSCAR _ hotel ROMEO juliet x-ray + < 6 alpha @ oscar bravo ] | '
      DB_HOST: localhost

/etc/wordpress:
  file.directory:
    - user: root
    - group: nginx
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode
