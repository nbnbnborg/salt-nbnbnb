un kernal IP forward  net.ipv4.ip_forward = 0:
  sysctl.present:
    - name: net.ipv4.ip_forward
    - value: 0

lvs-keepalived stop:
  service.dead:
    - name: keepalived
    - enable: False
