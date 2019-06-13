{% set service_list = ['firewalld','iptables','ip6tables','NetworkManager','nfs-config','postfix','auditd','cups','cupsd'] %}

{% for num in service_list %}
{{ num }}-disabled:
    service.disabled:
       - name: {{num}}
       - enable: False
{{ num }}-dead:
    service.dead:
       - name:  {{num}}
{% endfor %}
