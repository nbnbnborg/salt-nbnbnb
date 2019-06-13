configure a docker template machine!

testdemo:
salt 'docker.example.com' state.sls docker.kernel saltenv='prod' -t 300
salt 'docker.example.com' cmd.run 'reboot'

salt 'docker.example.com' state.sls docker.repo saltenv='prod'
salt 'docker.example.com' state.sls docker.install saltenv='prod' -t 300
# register-mirror daocloud
salt 'docker.example.com' state.sls docker.conf saltenv='prod' -t 300
salt 'docker.example.com' state.sls docker.service saltenv='prod' -t 300

# no harbor machine inline , docker service fail is ok.

docker login xt-docker-harbor-01.nbnbnb.org -u admin -p harbor.nbnbnb

salt 'docker.example.com' cmd.run "ip addr show docker0" #-c
salt 'docker.example.com' cmd.run 'docker info'
salt 'docker.example.com' state.sls docker.stop saltenv='prod' -t 300
salt 'docker.example.com' state.sls docker.uninstall saltenv='prod' -t 300




