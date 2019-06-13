# reduction ignore arp
reduction net.ipv4.conf.all.arp_ignore:
  sysctl.present:
    - name: net.ipv4.conf.all.arp_ignore
    - value: 0

reduction net.ipv4.conf.lo.arp_ignore:
  sysctl.present:
    - name: net.ipv4.conf.lo.arp_ignore
    - value: 0

reduction net.ipv4.conf.all.arp_announce:
  sysctl.present:
    - name: net.ipv4.conf.all.arp_announce
    - value: 0

reduction net.ipv4.conf.lo.arp_announce:
  sysctl.present:
    - name: net.ipv4.conf.lo.arp_announce
    - value: 0

# un config lvs
{% if 'lvs-realserver' in pillar %}
  {% for each_lvs in pillar['lvs-realserver'] %}

# config lvs vip
un {{ each_lvs['name'] }}-vip:
  cmd.run:
    - name: ifdown {{ "lo" + ":" + each_lvs['name'] }}
  file.absent:
    - name: /etc/sysconfig/network-scripts/ifcfg-{{ "lo" + ":" + each_lvs['name'] }}

  {% endfor %}
{% endif %}
