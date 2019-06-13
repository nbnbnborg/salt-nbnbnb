# salt '*' state.highstate saltenv='prod'
prod:
  'xt_lb4l_lvs_*.example.com':
    - lvs.service
  'xt_lb7l_haproxy_*.example.com':
    - haproxy.service
  'xt_web_nginx_*.example.com':
    - nginx.service
    - php.service
  'xt_db_mysql_*.example.com':
    - mysql.service
  'xt_cache_redis_*.example.com':
    - redis.service
  'xt_*_glusterfs_*.example.com':
    - gluster.service
  'xt_monitor_zabbix_*.example.com':
    - zabbix.service
  'xt_controller_salt_02.example.com':
    - saltstack.service
  'xt_fortress_jumpserver_*.example.com':
    - jumpserver.service
  'noname':
    - openvpn.service

