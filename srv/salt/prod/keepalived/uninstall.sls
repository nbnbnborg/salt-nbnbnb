include:
  - keepalived.stop

keepalived uninstall:
  pkg.removed:
    - name: keepalived
