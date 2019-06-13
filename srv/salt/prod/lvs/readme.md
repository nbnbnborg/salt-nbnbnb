also i can add a lvs-keepalived project.

1.install

2.conf
  2 LB server share 1 VIP,conf 2 Real server.
  2 Real server listen VIP(arp conf)
  need configure pillar/lvs

3.service

4.stop

5.uninstall

see python code:
ll /usr/lib/python2.7/site-packages/salt/states|grep lvs

demotest:
in test demo,
use linux-node1.example.com to configure keepalived,
for manage lvs cosplay lvs backup(auto run in master),
real server is linux-node(2|3).example.com

# -t 300 test='True'
salt -E 'linux-node(2|3).example.com' state.sls nginx.service saltenv='prod'

salt -E 'linux-node(2|3).example.com' state.sls lvs.realserver saltenv='prod'
salt 'linux-node1.example.com' state.sls lvs.loadbalance saltenv='prod'

salt -E 'linux-node(1|2|3).example.com' cmd.run "ip addr show eth0"
#ip -c addr show eth0

salt -E 'linux-node(2|3).example.com' cmd.run "curl 192.168.56.10:80"
salt 'linux-node2.example.com' state.sls lvs.realserver_stop_vip saltenv='prod'
salt -E 'linux-node(2|3).example.com' cmd.run "curl 192.168.56.10:80"
salt -E 'linux-node(2|3).example.com' cmd.run "curl 192.168.56.10:80"
salt 'linux-node3.example.com' state.sls lvs.realserver_stop_vip saltenv='prod'
salt -E 'linux-node(2|3).example.com' cmd.run "curl 192.168.56.10:80"
salt 'linux-node1.example.com' state.sls lvs.loadbalance_stop_lvs saltenv='prod'

salt -E 'linux-node(2|3).example.com' state.sls nginx.uninstall saltenv='prod'

Special Instructions:
default configure file keepalived.conf (in keepalived-1.3.5-6.el7.x86_64.rpm)
show a Layer7 demo.amazing!
but,at now,this program only use keepalived to manage lvs in layer 4!

other detail:
use keepalived to manage lvs(replace ipvsadm) LB & HA.

for importent things is which algorithm(rr,wrr,wlc etc.) & operating mode(3+1).

IF WANT Layer 4 LB&HA,ALSO CAN USE NGINX(Consul+upsync+Nginx1.9.10 dynamics LB)+KEEPALIVED_HA
