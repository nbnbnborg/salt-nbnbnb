include:
  - keepalived.install
  - keepalived.conf

keepalived service:
  service.running:
    - name: keepalived
    - enable: True
    - reload: True
    - require:
      - file: "lvs keepalived conf"
    - watch:
      - file: "lvs keepalived conf"
