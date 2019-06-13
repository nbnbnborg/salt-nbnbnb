include:
  - lvs-keepalived.install
  - lvs-keepalived.conf

#compatible DR & NAT
#DR not need,NAT need.
kernal IP forward net.ipv4.ip_forward:
  sysctl.present:
    - name: net.ipv4.ip_forward
    - value: 1

lvs-keepalived service:
  service.running:
    - name: keepalived
    - enable: True
    - reload: True
    - require:
      - file: /etc/keepalived/keepalived.conf
    - watch:
      - file: /etc/keepalived/keepalived.conf
