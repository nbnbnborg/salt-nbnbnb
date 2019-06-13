/etc/php-fpm.conf:
  file.managed:
    - source: salt://php/php-fpm.conf.template
    - user: root
    - group: root
    - mode: 644

/etc/php-fpm.d/www.conf:
  file.managed:
    - source: salt://php/www.conf.template
    - user: root
    - group: root
    - mode: 644

/etc/php.ini:
  file.managed:
    - source: salt://php/php.ini.template
    - user: root
    - group: root
    - mode: 644

# of course, this 3 filedir will be create by rpm.
# but,I should watch_in service.
/etc/php-fpm.d:
  file.directory:
    - user: root 
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode 

/etc/php.d:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode

/etc/php-zts.d:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode
