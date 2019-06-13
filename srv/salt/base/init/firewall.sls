firewalld-stop:
  service.dead:
    - name: firewalld
    - enable: False

firewalld-disabled:
  service.disabled:
    - name: firewalld
