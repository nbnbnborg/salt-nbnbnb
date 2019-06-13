include:
  - haproxy.install
  - haproxy.conf

set ip_nonlocal_bind = 1:
  sysctl.present:
    - name: net.ipv4.ip_nonlocal_bind
    - value: 1

haproxy service:
  service.running:
    - name: haproxy
    - enable: True
    - reload: True
    - require:
      - file: /etc/haproxy/haproxy.cfg
    - watch:
      - file: /etc/haproxy/haproxy.cfg
