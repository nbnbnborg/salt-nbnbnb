1.install:

2.conf:

3.service:

4.stop:


5.uninstall:

testdemo:
salt 'linux-node3.example.com' state.sls zabbix.install saltenv='prod' -t 600

#Succeeded: 11 (changed=1)
#Failed:     1
# --> Processing Conflict: php72u-pdo-7.2.17-1.ius.centos7.x86_64 conflicts php-pdo < 7.2.17-1.ius.centos7
# --> Processing Conflict: php72u-common-7.2.17-1.ius.centos7.x86_64 conflicts php-common < 7.2.17-1.ius.centos7
# --> Finished Dependency Resolution
# Error: php72u-pdo conflicts with php-pdo-5.4.16-46.el7.x86_64
# Error: php72u-common conflicts with php-common-5.4.16-46.el7.x86_64
#Remedy:
#salt 'linux-node3.example.com' state.sls zabbix.php72u saltenv='prod' -t 300

salt 'linux-node3.example.com' state.sls mysql.rpm-install saltenv='prod' -t 600
salt 'linux-node3.example.com' state.sls mysql.service saltenv='prod' -t 600
salt 'linux-node3.example.com' state.sls mysql.security saltenv='prod' -t 600

salt 'linux-node3.example.com' state.sls zabbix.conf saltenv='prod' -t 300
salt 'linux-node3.example.com' state.sls zabbix.mysql saltenv='prod' -t 300
salt 'linux-node3.example.com' state.sls zabbix.service saltenv='prod' -t 300

salt 'linux-node3.example.com' state.sls mysql.stop saltenv='prod' -t 600
salt 'linux-node3.example.com' state.sls mysql.rpm-uninstall saltenv='prod' -t 600


salt 'linux-node3.example.com' state.sls zabbix.stop saltenv='prod' -t 300
salt 'linux-node3.example.com' state.sls zabbix.uninstall saltenv='prod' -t 300
salt 'linux-node3.example.com' state.sls init.repo_ius saltenv='base'

