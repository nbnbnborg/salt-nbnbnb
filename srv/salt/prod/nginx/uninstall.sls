include:
  - nginx.stop

nginx uninstall:
  pkg.removed:
    - name: nginx
    - require:
      - service: "nginx stop"
