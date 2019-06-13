include:
  - mysql.rpm-install
  - mysql.service

#python-mysqldb:
#  pkg.installed

#mysql security init:
#  cmd.script:
#    - name: masterscript
#    - source: salt://path/to/masterscript
#    - cwd: /
#    - stateful:
#      - test_name: masterscript test

#https://docs.saltstack.com/en/latest/ref/modules/all/salt.modules.mysql.html#module-salt.modules.mysql
#/etc/salt/minion file append mysql conf:
#  file.append:
#    - name: /etc/salt/minion
#    - template: jinja
#    - source:
#      - salt://mysql/mysql-minion.template

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
#    - require:
#    #      - service: mysql

# if conf /etc/salt/minion.d/mysql-minion.conf twice,
# i need restart minion twice,
# this sls well not run.

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
