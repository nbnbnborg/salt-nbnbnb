100% done.for 2 pleace environment.

program start at env_init.sls
1	dns	file.managed	dns.sls
2	firewall	service.dead	firewall.sls
3	selinux	file.managed	selinux.sls
4	limit	file.managed	limit.sls
5	ssh	file.managed	ssh.sls
6	systctl	systctl	systctl.sls
7	down nouse service	service	service_down.sls
8	ntp	file.managed	chrony.sls
9	base soft	pkg.installed	basesoft.sls
10	repo	file.managed	repo.sls
11	zabbix-agent	X	zabbix_agent.sls
12	audit	X	audit.sls
13	PS1	X	profile.sls

#salt 'linux-node2*' sys.state_doc service
#salt 'linux-node2*' sys.doc sys.doc

#salt 'linux-node1.example.com' state.sls saltenv='base' init.python27 test="True"
#systemctl restart salt-master
#systemctl restart salt-minion

# debug func : maybe need require other.
salt 'linux-node3.example.com' state.sls init.audit saltenv='base'
salt 'linux-node3.example.com' state.sls init.basesoft saltenv='base'
salt 'linux-node3.example.com' state.sls init.chrony saltenv='base'
salt 'linux-node3.example.com' state.sls init.dns saltenv='base'
salt 'linux-node3.example.com' state.sls init.firewall saltenv='base'
salt 'linux-node3.example.com' state.sls init.limit saltenv='base'
salt 'linux-node3.example.com' state.sls init.profile saltenv='base'
salt 'linux-node3.example.com' state.sls init.repo saltenv='base'
salt 'linux-node3.example.com' state.sls init.selinux saltenv='base'
salt 'linux-node3.example.com' state.sls init.service_down saltenv='base'
salt 'linux-node3.example.com' state.sls init.ssh saltenv='base'
salt 'linux-node3.example.com' state.sls init.sysctl saltenv='base'
salt 'linux-node3.example.com' state.sls init.user saltenv='base'

# Now,above code is equal to follow.
salt 'linux-node2.example.com' state.sls init.env_init saltenv='base' -t 600
# when in company,well has 7 Failed,please pass it.bacause of yum cache error to make.
# when 2 Failed,setenforce auditd. is OK. 

# saltstack.service
