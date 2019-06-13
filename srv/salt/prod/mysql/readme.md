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

other is normal.

If direct to run mysql.security.sls without run rpm-install.sls & service.sls,
this mysql_secure.sh will not work!

If want to uninstall,could direct to run rpm-uninstall.sls witout run stop.sls is OK.
