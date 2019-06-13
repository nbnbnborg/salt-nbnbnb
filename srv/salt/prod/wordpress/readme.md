1.install

2.conf
  require:MySQL-python

3.uninstall
  will un MySQL-python

demotest:
shutdown VM,change virtual MEM to 3G/4G & 2CPU * 1CORE/CPU.
salt 'linux-node2.example.com' state.sls nginx.service saltenv='prod' -t 300

salt 'linux-node2.example.com' state.sls php.yum-replace-php saltenv='prod' -t 300
salt 'linux-node2.example.com' state.sls php.install saltenv='prod' -t 300
salt 'linux-node2.example.com' state.sls php.conf saltenv='prod' -t 300
salt 'linux-node2.example.com' state.sls wordpress.conf saltenv='prod' -t 300
#salt 'linux-node2.example.com' state.sls nginx.service saltenv='prod' -t 300

salt 'linux-node2.example.com' state.sls php.service saltenv='prod' -t 300

salt 'linux-node2.example.com' state.sls mysql.rpm-install saltenv='prod' -t 600
salt 'linux-node2.example.com' state.sls mysql.service saltenv='prod' -t 600
salt 'linux-node2.example.com' state.sls mysql.security saltenv='prod' -t 600
salt 'linux-node2.example.com' state.sls wordpress.mysql saltenv='prod' -t 300

salt 'linux-node2.example.com' state.sls nginx.service saltenv='prod' -t 300
#browser: 192.168.56.12:80
Site Title: salt
Username: admin
Password: 4G3oIXkBz0Zw6jK!$x
Your Email: admin@qq.com
Install!


salt 'linux-node2.example.com' state.sls mysql.stop saltenv='prod' -t 600
salt 'linux-node2.example.com' state.sls mysql.rpm-uninstall saltenv='prod' -t 600

salt 'linux-node2.example.com' state.sls php.stop saltenv='prod' -t 300
salt 'linux-node2.example.com' state.sls php.uninstall saltenv='prod' -t 300

salt 'linux-node2.example.com' state.sls wordpress.uninstall saltenv='prod' -t 100

shutdown VM,change virtual MEM to 2G & 1CPU * 1CORE/CPU.
