1.install
  rpm-install from mysql.com

2.service
  need rpm-install.sls
  to start mysqld

3.security
  need service
  need expect
  when mysqld start,we can run script(expect)

  after init mysql password,
  we should to append /etc/salt/minion.d/mysql-minion.conf,
  to let salt can manage mysql.


demotest:
salt 'linux-node2.example.com' state.sls mysql.rpm-install saltenv='prod' -t 600
salt 'linux-node2.example.com' state.sls mysql.service saltenv='prod' -t 600
salt 'linux-node2.example.com' state.sls mysql.security saltenv='prod' -t 600
salt 'linux-node2.example.com' state.sls mysql.stop saltenv='prod' -t 600
salt 'linux-node2.example.com' state.sls mysql.rpm-uninstall saltenv='prod' -t 600

other:
1.If direct to run mysql.security.sls without run rpm-install.sls & service.sls,
  this mysql_secure.sh will not work!

2.If want to uninstall,could direct to run rpm-uninstall.sls witout run stop.sls is OK.

3.maybe need other project to add user etc.
