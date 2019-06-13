this program test failed.

1.install:

2.conf:

3.service:

  real_server need bind VIP && arp_ignore,see at <<Q19Linux-P295>>.


4.stop:

5.uninstall:

demotest:
linux-node1.example.com: LB4L-BACKUP
linux-node2|3.example.com: Nginx REAL_SERVER_1|2

salt 'linux-node1.example.com' state.sls lvs-keepalived.service saltenv='prod' -t 300
salt -E 'linux-node(2|3).example.com' state.sls lvs-keepalived.real_server_start saltenv='prod' -t 300
salt -E 'linux-node(2|3).example.com' state.sls nginx.service saltenv='prod' -t 300
salt -E 'linux-node1.example.com' cmd.run "ip addr show eth0" # -c
salt -E 'linux-node(2|3).example.com' cmd.run "ip addr show lo" # -c

windows: test failed.
route add 10.0.0.3 mask 255.255.255.255 192.168.56.2 # metric 3 if 2
route delete 10.0.0.3

curl http://10.0.0.3:80/
salt -E 'linux-node(2|3).example.com' state.sls nginx.uninstall saltenv='prod' -t 300
salt -E 'linux-node(2|3).example.com' state.sls lvs-keepalived.real_server_stop saltenv='prod' -t 300
salt 'linux-node1.example.com' state.sls lvs-keepalived.uninstall saltenv='prod' -t 300
