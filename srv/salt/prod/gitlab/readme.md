# description

docs:
https://docs.gitlab.com/ce/development/architecture.html
https://docs.gitlab.com/ce/
https://gitlab.com/gitlab-org/gitlab-ce

good ops Chinese doc:
https://github.com/jaywcjlove/handbook/blob/master/CentOS/CentOS7安装维护Gitlab.md
 
NGINX, Postgres, Redis

demotest:
salt 'linux-node2.example.com' state.sls gitlab.install saltenv='prod' -t 300
salt 'linux-node2.example.com' state.sls gitlab.conf saltenv='prod' -t 30
salt 'linux-node2.example.com' state.sls gitlab.service saltenv='prod' -t 300
salt 'linux-node2.example.com' state.sls gitlab.backups saltenv='prod' -t 300
# look doc to restore.
#salt 'linux-node2.example.com' state.sls gitlab.restore saltenv='prod' -t 300
salt 'linux-node2.example.com' state.sls gitlab.stop saltenv='prod' -t 300
salt 'linux-node2.example.com' state.sls gitlab.uninstall saltenv='prod' -t 200

