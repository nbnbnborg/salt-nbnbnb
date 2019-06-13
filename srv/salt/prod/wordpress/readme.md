1.install

2.conf

3.uninstall

demotest:
salt 'linux-node2.example.com' state.sls nginx.service saltenv='prod' -t 300
salt 'linux-node2.example.com' state.sls wordpress.conf saltenv='prod' -t 300
salt 'linux-node2.example.com' state.sls nginx.service saltenv='prod' -t 300

salt 'linux-node2.example.com' state.sls php.yum-replace-php saltenv='prod' -t 300
salt 'linux-node2.example.com' state.sls php.install saltenv='prod' -t 300
salt 'linux-node2.example.com' state.sls php.conf saltenv='prod' -t 300
salt 'linux-node2.example.com' state.sls php.service saltenv='prod' -t 300

salt 'linux-node2.example.com' state.sls mysql.rpm-install saltenv='prod' -t 600
salt 'linux-node2.example.com' state.sls mysql.service saltenv='prod' -t 600
salt 'linux-node2.example.com' state.sls mysql.security saltenv='prod' -t 600
salt 'linux-node2.example.com' state.sls wordpress.mysql saltenv='prod' -t 300


salt 'linux-node2.example.com' state.sls mysql.stop saltenv='prod' -t 600
salt 'linux-node2.example.com' state.sls mysql.rpm-uninstall saltenv='prod' -t 600

salt 'linux-node2.example.com' state.sls php.stop saltenv='prod' -t 300
salt 'linux-node2.example.com' state.sls php.uninstall saltenv='prod' -t 300


