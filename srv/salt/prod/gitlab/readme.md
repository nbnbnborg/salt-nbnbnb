# description

NGINX, Postgres, Redis

demotest:
salt 'linux-node2.example.com' state.sls gitlab.install saltenv='prod' -t 300
salt 'linux-node2.example.com' state.sls gitlab.conf saltenv='prod' -t 30
salt 'linux-node2.example.com' state.sls gitlab.service saltenv='prod' -t 300
salt 'linux-node2.example.com' state.sls gitlab.uninstall saltenv='prod' -t 200

