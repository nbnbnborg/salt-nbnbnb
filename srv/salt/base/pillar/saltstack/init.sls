saltstack:
  {% if grains['fqdn'].endswith('.nbnbnb.org') %}
  SALTSTACK_MASTER: "192.168.56.227"
  {% elif grains['fqdn'].endswith('.example.com') %}
  SALTSTACK_MASTER: "192.168.56.11"
  {% endif %}

