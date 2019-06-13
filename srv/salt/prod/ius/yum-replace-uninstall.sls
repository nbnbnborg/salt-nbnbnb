yum-plugin-replace uninstall:
  pkg.removed:
    - name: yum-plugin-replace
    - unless: test ${rpm -q yum-plugin-replace} =1

