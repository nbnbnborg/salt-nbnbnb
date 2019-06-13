# description

demotest:
salt 'linux-node2.example.com' state.sls git.install saltenv='prod' -t 200
salt 'linux-node2.example.com' state.sls git.uninstall saltenv='prod' -t 60
