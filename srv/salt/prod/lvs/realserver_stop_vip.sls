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


