chrony:
  {% if grains['fqdn'].endswith('.nbnbnb.org') %}
  server_ip: "192.168.56.227"
  {% elif grains['fqdn'].endswith('.example.com') %}
  server_ip: "192.168.56.11"
  {% endif %}
