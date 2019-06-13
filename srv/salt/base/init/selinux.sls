selinux:
  file.replace:
    - name: /etc/selinux/config
    - pattern: SELINUX=enforcing
    - repl: SELINUX=disabled
    - count: 1

setenforce:
  cmd.run:
    - name: setenforce 0
