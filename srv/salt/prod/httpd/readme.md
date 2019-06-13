1.install

2.conf

3.service

4.stop

5.uninstall

demotest:
salt 'linux-node2.example.com' state.sls httpd.service saltenv='prod' -t 300
salt 'linux-node2.example.com' state.sls httpd.uninstall saltenv='prod' -t 60
