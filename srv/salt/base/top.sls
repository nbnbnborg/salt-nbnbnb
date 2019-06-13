# salt '*' state.highstate saltenv='base'
base:
  'linux-node[2-3].example.com':
    - init.env_init
    - init.repo_replace_url
    - init.repo_zabbix
    - init.repo_replace_url
    - saltstack.service

  #this need except cobbler?
  '*.nbnbnb.org':
    - init.env_init
    - saltstack.service
