include:
  - lvs.stop

lvs uninstall:
  pkg.removed:
    - name: ipvsadm
