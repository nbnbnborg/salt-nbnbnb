lvs-keepalived:
  # grains['fqdn'] = 'xt-func-srv-nu.nbnbnb.org'

  {% if grains['fqdn'].endswith('.nbnbnb.org') %}
    
    {% if grains['fqdn'].startswith('xt-lb4l-lvs') %}
  ROUTER_ID: lvs_ha
  VRRP_INSTANCE: LVS
  VIRTUAL_ROUTER_ID: 54
  VIP: 10.0.0.3
      {% if grains['fqdn'].split(str=".")[0][-2:] in ["01","03","05","07"] %}
  STATE: MASTER
  PRIORITY: 150
      {% elif grains['fqdn'].split(str=".")[0][-2:] in ["02","04","06","08"] %}
  STATE: BACKUP
  PRIORITY: 100
      {% endif %}

    #{% elif grains['fqdn'].startswith('xt-lb4l-lvs') %}
    
    {% endif %}

  {% elif grains['fqdn'].endswith('.example.com') %}

  ROUTER_ID: lvs_test
  VRRP_INSTANCE: TEST
  VIRTUAL_ROUTER_ID: 53
  VIP: 10.0.0.3

  VIRTUAL_SERVER_IP: 10.0.0.3
  VIRTUAL_SERVER_PORT: 80
  REAL_SERVER_1_IP: 192.168.56.12
  REAL_SERVER_1_PORT: 80
  REAL_SERVER_2_IP: 192.168.56.13
  REAL_SERVER_2_PORT: 80
    {% if grains['fqdn'].startswith('linux-node2') %}
  STATE: MASTER
  PRIORITY: 150
    {% elif grains['fqdn'].startswith('linux-node1') %}
  STATE: BACKUP
  PRIORITY: 100
    {% endif %}

  {% endif %}
