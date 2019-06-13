include:
  - postgresql.install

initdb:
  file.managed:
    - name: /var/lib/pgsql/11/pgsql_init_change_passwd.sh
    - source: salt://postgresql/pgsql_init_change_passwd.sh
    - user: root
    - group: root
    - mode: 700
  cmd.run:
    - name: /bin/bash /var/lib/pgsql/11/pgsql_init_change_passwd.sh
    - unless: test -f /var/lib/pgsql/11/data/PG_VERSION
    - require:
      - pkg: "postgresql install"
      - file: "/var/lib/pgsql/11/pgsql_init_change_passwd.sh"

#remove /var/lib/pgsql/11/pgsql_init_change_passwd.sh:
#  file.absent:
#    - name: /var/lib/pgsql/11/pgsql_init_change_passwd.sh
#    - require:
#      - cmd: "/bin/bash /var/lib/pgsql/11/pgsql_init_change_passwd.sh"
#    - unless: test ! -f /var/lib/pgsql/11/pgsql_init_change_passwd.sh 
