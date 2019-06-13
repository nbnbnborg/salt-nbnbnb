/var/lib/pgsql/11/data/postgresql.conf:
  file.managed:
    - name: /var/lib/pgsql/11/data/postgresql.conf
    - source: salt://postgresql/postgresql.conf.template
    - template: jinja
    - user: postgres
    - group: postgres
    - mode: 600
    - default:
      # for easy.
      LISTEN_ADDRESSES: "'*'"

/var/lib/pgsql/11/data/pg_hba.conf:
  file.managed:
    - name: /var/lib/pgsql/11/data/pg_hba.conf
    - source: salt://postgresql/pg_hba.conf.template
    - template: jinja
    - user: postgres
    - group: postgres
    - mode: 600
    #- default:
      

/var/lib/pgsql/11/:
  file.directory:
    - user: postgres
    - group: postgres
    - dir_mode: 700
    - file_mode: 600
    - recurse:
      - user
      - group
      - mode
