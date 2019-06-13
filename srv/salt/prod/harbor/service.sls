include:
  - harbor.conf

harbor docker compose service:
  service.running:
    - name: harbor
    - enable: True
    - reload: True
    - require:
      - cmd: "harbor systemctl daemon-reload"
      - file: "/opt/harbor/harbor.cfg"
    - watch:
      - cmd: "harbor systemctl daemon-reload"
      - file: "/opt/harbor/harbor.cfg"
