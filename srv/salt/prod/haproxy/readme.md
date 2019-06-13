1.install

2.conf
  log rsyslog

3.service

4.stop

5.uninstall


demotest:
salt -E 'linux-node(2|3).example.com' state.sls keepalived.service saltenv='prod' -t 300
salt -E 'linux-node(2|3).example.com' state.sls haproxy.service saltenv='prod' -t 300
salt -E 'linux-node(2|3).example.com' state.sls cmd.run 'ip addr show eth0|grep 192.168.56.10'
curl http://192.168.56.10:8888/haproxy-status -X GET -u haproxy:nbnbnb.org
salt -E 'linux-node(2|3).example.com' state.sls haproxy.uninstall saltenv='prod' -t 300
salt -E 'linux-node(2|3).example.com' state.sls keepalived.uninstall saltenv='prod' -t 300

