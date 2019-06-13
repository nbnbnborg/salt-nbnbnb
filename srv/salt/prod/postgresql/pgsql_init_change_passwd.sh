rm -rf /var/lib/pgsql/11/{data,backups,initdb.log}
/usr/pgsql-11/bin/postgresql-11-setup initdb && \
systemctl start postgresql-11 &&
#su - postgres -c 'psql -U postgres -c \"alter user postgres password \'pgsql.nbnbnb\';\"'
su - postgres <<EOF
psql -U postgres -c "alter user postgres password 'pgsql.nbnbnb';"
EOF
systemctl stop postgresql-11
