haproxy:
  {% if grains['fqdn'].startswith('xt-lb7l-haproxy') %}
  HAPROXY_VIP: 192.168.56.7
  HAPROXY_PORT: 80
  DEFAULT_BACKEND: wordpress

  REAL_SERVER_1_NAME: xt-web-nginx-01
  REAL_SERVER_1_IP: 192.168.56.32
  REAL_SERVER_1_PORT: 80

  REAL_SERVER_2_NAME: xt-web-nginx-02
  REAL_SERVER_2_IP: 192.168.56.33
  REAL_SERVER_2_PORT: 80

  {% elif grains['fqdn'].startswith('linux-node') %}
  HAPROXY_VIP: 192.168.56.10
  HAPROXY_PORT: 80
  DEFAULT_BACKEND: wordpress
  
  REAL_SERVER_1_NAME: linux-node2
  REAL_SERVER_1_IP: 192.168.56.12
  REAL_SERVER_1_PORT: 80
  
  REAL_SERVER_2_NAME: linux-node3
  REAL_SERVER_2_IP: 192.168.56.13
  REAL_SERVER_2_PORT: 80
  {% endif %}
  
