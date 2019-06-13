keepalived:
  # grains['fqdn'] = 'xt-func-srv-nu.nbnbnb.org'

  {% if grains['fqdn'].endswith('.nbnbnb.org') %}
    
    {% if grains['fqdn'].startswith('xt-lb7l-haproxy') %}
  ROUTER_ID: haproxy_ha
  VRRP_INSTANCE: HAPROXY
  VIRTUAL_ROUTER_ID: 52
  VIP: 192.168.56.7
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

  ROUTER_ID: keepalived_test
  VRRP_INSTANCE: TEST
  VIRTUAL_ROUTER_ID: 51
  VIP: 192.168.56.10
    {% if grains['fqdn'].startswith('linux-node2') %}
  STATE: MASTER
  PRIORITY: 150
    {% elif grains['fqdn'].startswith('linux-node3') %}
  STATE: BACKUP
  PRIORITY: 100
    {% endif %}

  {% endif %}
