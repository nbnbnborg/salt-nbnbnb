# description
# this is a no sec project.

chinese:
  11:
     http://www.postgres.cn/docs/11/
  9:
     https://github.com/netkiller/netkiller.github.io/
     http://www.netkiller.cn/postgresql/pgsql.yum.new.html

PDF:
  11:
     https://www.postgresql.org/files/documentation/pdf/11/postgresql-11-A4.pdf

demotest:
#salt 'linux-node2.example.com' state.sls postgresql.repo saltenv='prod' -t 60
#salt 'linux-node2.example.com' state.sls postgresql.install saltenv='prod' -t 600
salt 'linux-node2.example.com' state.sls postgresql.init saltenv='prod' -t 60

#salt 'linux-node2.example.com' state.sls postgresql.conf saltenv='prod' -t 60
salt 'linux-node2.example.com' state.sls postgresql.service saltenv='prod' -t 60
# conf no passwd for postgres
salt 'linux-node2.example.com'  cmd.run 'psql -U postgres -h 192.168.56.12 -l'
#su - postgres -c 'psql -U postgres -W pgsql.nbnbnb -l;'

#salt 'linux-node2.example.com' state.sls postgresql.stop saltenv='prod' -t 60
salt 'linux-node2.example.com' state.sls postgresql.uninstall saltenv='prod' -t 60

