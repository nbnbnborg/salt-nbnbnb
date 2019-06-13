# salt '*' state.highstate saltenv='prod'
prod:
  'xt-lb4l-lvs-*.example.com':
    - lvs.service
  'xt-lb7l-haproxy-*.example.com':
    - haproxy.service
  'xt-web-nginx-*.example.com':
    - nginx.service
    - php.service
  'xt-db-mysql-*.example.com':
    - mysql.service
  'xt-cache-redis-*.example.com':
    - redis.service
  'xt-*-glusterfs-*.example.com':
    - gluster.service
  'xt-monitor-zabbix-*.example.com':
    - zabbix.service
  'xt-controller-salt-02.example.com':
    - saltstack.service
  'xt-fortress-jumpserver-*.example.com':
    - jumpserver.service
  'noname':
    - openvpn.service

