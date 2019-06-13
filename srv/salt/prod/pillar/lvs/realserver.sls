{% if grains['fqdn'].endswith('.example.com') %}
lvs-realserver:
  - name: lvstest
    vip: 192.168.56.10
{% endif %}

