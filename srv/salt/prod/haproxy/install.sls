#include:
#  - ius.yum-replace-install

haproxy18u install:
  pkg.installed:
    - name: haproxy18u
#    - require:
#      - pkg: "yum-plugin-replace install"

