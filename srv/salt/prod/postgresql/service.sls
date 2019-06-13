include:
  - postgresql.install
  - postgresql.conf

postgresql service:
  service.running:
    - name: postgresql-11
    - enable: True
    - reload: True
    - require:
      - file: /var/lib/pgsql/11/data/postgresql.conf
      - file: /var/lib/pgsql/11/data/pg_hba.conf
    - watch:
      - file: /var/lib/pgsql/11/data/postgresql.conf
      - file: /var/lib/pgsql/11/data/pg_hba.conf
