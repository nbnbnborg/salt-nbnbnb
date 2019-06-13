zabbix_repo_server:
  {% if grains['fqdn'].endswith('.nbnbnb.org') %}
  ZABBIX_COBBLER_COMMENT: "''"
  ZABBIX_ALI_COMMENT: "#"
  {% elif grains['fqdn'].endswith('.example.com') %}
  ZABBIX_COBBLER_COMMENT: "#"
  ZABBIX_ALI_COMMENT: "''"
  {% endif %}
