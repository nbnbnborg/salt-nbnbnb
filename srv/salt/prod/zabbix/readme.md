1.install:

2.conf:

3.service:

4.stop:


5.uninstall:

testdemo:
salt 'linux-node3.example.com' state.sls zabbix.install saltenv='prod' -t 300
salt 'linux-node3.example.com' state.sls zabbix.conf saltenv='prod' -t 300
salt 'linux-node3.example.com' state.sls zabbix.service saltenv='prod' -t 300
salt 'linux-node3.example.com' state.sls zabbix.stop saltenv='prod' -t 300
salt 'linux-node3.example.com' state.sls zabbix.uninstall saltenv='prod' -t 300


