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
