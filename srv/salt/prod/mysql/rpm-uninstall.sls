include:
  - mysql.stop

mysql-rpm-uninstall:
  pkg.removed:
    - name:
      - mysql-community-server
      - mysql-community-client
    - require:
      - service: "mysql stop"

/var/lib/mysql remove:
  cmd.run:
    - name: rm -rf /var/lib/mysql
    - unless: test ${test -d /var/lib/mysql} = 1

/usr/bin/mysql_secure.sh remove:
  cmd.run:
    - name: rm -rf /usr/bin/mysql_secure.sh
    - unless: test ${test -f /usr/bin/mysql_secure.sh} = 1
