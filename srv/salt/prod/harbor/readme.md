https://goharbor.io/docs/
machine: 2CPU 4GMEM 40GHDD
unixhot: http://k8s.unixhot.com/docker/harbor.html


1.compose install
python-pip rpm & pip install docker-compose(dream_ya)
or
wget https://mirrors.aliyun.com/docker-toolbox/linux/compose/1.21.2/docker-compose-Linux-x86_64 -O /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose
(dgstack)

2.How to make a Systemd Unit for docker-compose? 
https://github.com/docker/compose/issues/4266

3.install harbour.
https://github.com/goharbor/harbor/blob/master/docs/installation_guide.md

now use http mode,but must change to https!!
add nginx ssl,change cfg,change docker.service

demotest:
1CPU 2GMEM is OK!
192.168.56.235 cmd.run : 
rm -rf /etc/salt/minion_id && systemctl restart salt-minion

salt-key -A
salt 'xt_docker_harbor_01.nbnbnb.org' test.ping
salt 'xt_docker_harbor_01.nbnbnb.org' state.sls harbor.install saltenv='prod' -t 300
salt 'xt_docker_harbor_01.nbnbnb.org' state.sls harbor.conf saltenv='prod' -t 300
salt 'xt_docker_harbor_01.nbnbnb.org' state.sls harbor.script_install saltenv='prod' -t 300
salt 'xt_docker_harbor_01.nbnbnb.org' state.sls harbor.stop saltenv='prod' -t 300
salt 'xt_docker_harbor_01.nbnbnb.org' state.sls harbor.service saltenv='prod' -t 300
salt 'xt_docker_harbor_01.nbnbnb.org' state.sls harbor.stop saltenv='prod' -t 300
curl http://xt_docker_harbor_01.nbnbnb.org -u admin:harbor.nbnbnb

[root@xt_docker_harbor_01 /opt/harbor]# docker login http://xt_docker_harbor_01.nbnbnb.org:80 -u admin -p harbor.nbnbnb
WARNING! Using --password via the CLI is insecure. Use --password-stdin.
Error response from daemon: Get https://xt_docker_harbor_01.nbnbnb.org:80/v2/: http: server gave HTTP response to HTTPS client
