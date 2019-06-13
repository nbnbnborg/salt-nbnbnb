1.install

2.conf
  need configure pillar/haproxy

3.service

4.stop

5.uninstall


demotest:
# -t 300 test='True'
salt -E 'linux-node(2|3).example.com' state.sls keepalived.service saltenv='prod'
salt -E 'linux-node(2|3).example.com' state.sls keepalived.uninstall saltenv='prod'
salt -E 'linux-node(2|3).example.com' cmd.run "ip addr show eth0"
#ip -c addr show eth0
