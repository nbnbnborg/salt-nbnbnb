include:
  - mysql.rpm-install
  - mysql.service

{% set MYSQLADMIN_ROOT = "/usr/bin/" %}
mysqladmin add root password:
  cmd.run:
    - name: {{ MYSQLADMIN_ROOT }}mysqladmin -u root -h localhost password 'x92t@&jc93xs'
    - unless: mysql -uroot -hlocalhost -p"x92t@&jc93xs" -e "show databases;"

#python-mysqldb:
#  pkg.installed

/etc/salt/minion.d/mysql-minion.conf init:
  file.managed:
    - name: /etc/salt/minion.d/mysql-minion.conf
    - template: jinja
    - source: salt://mysql/files/etc/salt/minion.d/mysql-minion.conf.templa
te
    - user: root
    - group: root
    - mode: 640
    - default:
      PASSWORD: XXXXXXXX

##You can set a password for root accounts.


#You can remove root accounts that are accessible from outside the local host.

#You can remove anonymous-user accounts.

#You can remove the test database (which by default can be accessed by all users, even anonymous users), and privileges that permit anyone to access databases with names that start with test_.



/etc/salt/minion.d/mysql-minion.conf replace:
  file.managed:
    - name: /etc/salt/minion.d/mysql-minion.conf
    - template: jinja
    - source: salt://mysql/files/etc/salt/minion.d/mysql-minion.conf.template
    - user: root
    - group: root
    - mode: 640
    - default:
      PASSWORD: XXXXXXXX
#    - require:
#      - service: mysql

restart_minion_for_mysql:
  service.running:
    - name: salt-minion
    - watch:
      - file: /etc/salt/minion.d/mysql.conf
