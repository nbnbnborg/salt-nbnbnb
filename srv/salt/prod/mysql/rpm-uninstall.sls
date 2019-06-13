mysql-rpm-uninstall:
  pkg.removed:
    - name:
      - mysql-community-server
      - mysql-community-client

/var/lib/mysql remove:
  cmd.run:
    - name: rm -rf /var/lib/mysql
    - unless: test ${test -d /var/lib/mysql} = 1
