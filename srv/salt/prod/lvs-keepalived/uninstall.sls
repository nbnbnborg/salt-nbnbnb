include:
  - lvs-keepalived.stop

keepalived uninstall:
  pkg.removed:
    - name: keepalived
